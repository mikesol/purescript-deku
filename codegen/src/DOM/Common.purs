module DOM.Common where

import Prelude
import Prim hiding (Type)

import DOM.Spec (Definition)
import Data.Array as Array
import Data.Foldable (foldl)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, un)
import Data.Set (Set)
import Data.Set as Set
import Data.String as String
import Data.String.CodeUnits as CU
import Data.Tuple (uncurry)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, Expr, Ident(..), ImportDecl, Label, Proper(..), Type)
import Safe.Coerce (coerce)
import Tidy.Codegen (binaryOp, declImportAs, declValue, exprApp, exprCtor, exprIdent, exprOp, exprRecord, exprSection, exprString, typeApp, typeArrow, typeCtor, typeString)
import Tidy.Codegen.Class (class ToName, class ToQualifiedName, defaultToName, toName, toQualifiedName)
import Tidy.Codegen.Types (BinaryOp, Qualified(..))

newtype Ctor = Ctor String
derive newtype instance Eq Ctor
derive newtype instance Ord Ctor
derive instance Newtype Ctor _
instance ToQualifiedName Ctor Proper where toQualifiedName = toQualifiedName <<< Qualified Nothing <<< Proper <<< un Ctor
instance ToName Ctor Label where toName = defaultToName <<< un Ctor
instance ToName Ctor Proper where toName = toName <<< Proper <<< un Ctor
instance ToName Ctor Ident where toName = toName <<< Ident <<< un Ctor

type Interface =
    { ctor :: Ctor
    , name :: String
    , bases :: Array Ctor
    , members :: Array Attribute
    }

type Element =
    { ctor :: Ctor -- name in source
    , ns :: TagNS
    , tag :: String
    , interface :: Ctor
    }

type Keyword =
    { ctor :: Ctor
    , value :: String
    , index :: Ctor -- name in source and row index
    , attribute :: String 
    }

type Attribute =
    { name :: String
    , index :: Ctor -- name in source and row index
    , type :: TypeStub
    }

data TagNS = HTML | SVG | MathML
derive instance Eq TagNS
derive instance Ord TagNS

xhtmlNamespace :: TagNS -> Maybe String
xhtmlNamespace = case _ of
    HTML ->
        Nothing
    
    SVG ->
        Just "http://www.w3.org/2000/svg"

    MathML ->
        Just "http://www.w3.org/1998/Math/MathML"

namespaceBases :: TagNS -> Array String
namespaceBases = case _ of
    HTML ->
        [ "HtmlsvgGlobal"
        , "HtmlGlobal"
        , "Global"
        , "GlobalEventHandlers"
        , "ARIAMixin"
        ]

    SVG ->
        [ "HtmlsvgGlobal"
        , "SvgGlobal"
        , "Global"
        , "GlobalEventHandlers"
        , "ARIAMixin"
        ]

    MathML ->
        [ "Global"
        , "GlobalEventHandlers"
        , "ARIAMixin"
        ]

baseInterfaces :: Array String
baseInterfaces =
    Array.nub $ bind [ HTML, SVG, MathML ] namespaceBases

mkKeyword :: String -> String -> Maybe Keyword
mkKeyword attribute value = case value of
    "section-" -> Nothing
    "1" -> Just { ctor : Ctor "x1", value : "1", index, attribute }
    "A" -> Just { ctor : Ctor "xA", value : "A", index, attribute }
    "I" -> Just { ctor : Ctor "xI", value : "I", index, attribute }

    _ -> Just { ctor : Ctor $ unSnake value, value : value, index, attribute }

    where

    index :: Ctor
    index =
        Ctor $ unSnake attribute

mkAttribute :: String -> Maybe Attribute
mkAttribute name =
    Just { name, index : Ctor $ unSnake name, type : TypeString }

mkHandler :: String -> Maybe Attribute
mkHandler name =
    Just { name : "on" <> name, index: Ctor $ "on" <> capitalize ( unSnake name ), type : TypeEventHandler }

mkElement :: TagNS -> String -> Maybe Element
mkElement ns name =
    Just
        { ctor : Ctor $ unSnake $ escape name
        , ns : ns
        , tag : name
        , interface : Ctor $ tagToInterface ns name
        }

mkInterface :: TagNS -> String -> Array Attribute -> Maybe Interface
mkInterface ns name members =
    if name `Array.elem` baseInterfaces then
        Just { name, ctor : Ctor name, members, bases : [] }
    else
        Just { name, ctor : Ctor name, members, bases : coerce $ namespaceBases ns }

escape :: String -> String
escape n = 
    if Set.member n reserved then "x" <> n else n

reserved :: Set String
reserved =
    Set.fromFoldable
        [ "data"
        , "if"
        , "class"
        , "type"
        , "module"
        ]
        
tagToInterface :: TagNS -> String -> String
tagToInterface ns tag = case tag of 
    "a" -> "HTMLAnchorElement"
    "textarea" -> "HTMLTextAreaElement"
    "br" -> "HTMLBRElement"
    "hr" -> "HTMLHRElement"
    "td" -> "HTMLTableDataCellElement"
    "p" -> "HTMLParagraphElement"

    _ -> do
        let formatted = capitalize $ unSnake tag
        if formatted `Array.elem` baseInterfaces then
            formatted
        else
            prefix <> formatted <> "Element"
        
    where

    prefix = case ns of
        SVG -> "SVG"
        HTML -> "HTML"
        MathML -> "MathML"

unSnake :: String -> String
unSnake =
    _.acc
        <<< foldl
            (\{ dropped, acc } c -> case dropped, c of
                _, '-' -> { dropped : true, acc }
                _, ' ' -> { dropped : true, acc }
                _, '/' -> { dropped : true, acc }
                _, ':' -> { dropped : true, acc }
                true, _ -> { dropped : false, acc : acc <> ( String.toUpper $ CU.singleton c ) }
                _, _ -> { dropped : false, acc : acc <> CU.singleton c }
            )
            { dropped : false, acc : "" }
        <<< CU.toCharArray

capitalize :: String -> String
capitalize = 
    String.splitAt 1 >>> \{ before, after } -> String.toUpper before <> after

eltModule :: Ctor -> String
eltModule ( Ctor name ) =
    "Deku.DOM.Elt." <> capitalize name

eltType :: Ctor -> String
eltType ( Ctor name ) =
    capitalize name <> "_"

attrModule :: Ctor -> String
attrModule ( Ctor name ) =
    "Deku.DOM.Attr." <> capitalize name

attrType :: Ctor -> String
attrType ( Ctor name ) =
    capitalize name

type Specification =
    { keywords :: Array Keyword
    , interfaces :: Array Interface
    , elements :: Array Element
    }

-- | Sorts an array of definitions into a specification.
preprocess :: TagNS -> Array Definition -> Specification
preprocess ns defs = do
    let
        keywords :: Array Keyword
        keywords =
            Array.mapMaybe ( uncurry mkKeyword ) do
                dfn <- Array.filter ( not <<< eq "argument" <<< _.type ) defs
                text <- dfn.linkingText
                for <- Array.nub $ Array.mapMaybe forAttribute dfn.for
                pure $ for /\ text

            where

            forAttribute :: String -> Maybe String
            forAttribute f =
                case String.split ( String.Pattern "/" ) f of
                    [ _, attr ] | attr /= "" ->
                        Just attr
                    
                    _ ->
                        Nothing

        elements :: Array Element
        elements =
            bind defs case _ of
                { type : "element", linkingText } ->  
                    Array.mapMaybe ( mkElement ns ) linkingText
                
                _ ->
                    []

        interfaceMembers :: Foreign.Object ( Array Attribute )
        interfaceMembers =
            Foreign.fromFoldableWith append do
                bind defs case _ of
                    -- basic attributes
                    { type : "element-attr", for, linkingText } -> do
                        let
                            filtered = flip Array.mapMaybe linkingText \attr ->
                                    case String.stripPrefix ( String.Pattern "on" ) attr of
                                        Just eventName ->
                                            mkHandler eventName
                                        Nothing ->
                                            mkAttribute attr
                        
                        map ( ( _ /\  filtered ) <<< tagToInterface ns ) for

                    -- could not find a definition for aria attributes so we translate the properties instead
                    { type : "attribute", for : [ "ARIAMixin" ], linkingText } -> do
                        [ "ARIAMixin" /\ Array.mapMaybe ( mkAttribute <<< unAria ) linkingText ]
                    
                    -- detect event handler attributes
                    { type : "attribute", for, linkingText } -> do
                        let filtered =
                                flip Array.mapMaybe linkingText
                                    $ mkHandler <=< String.stripPrefix ( String.Pattern "on" )
                        
                        if filtered == [] then [] else map ( _ /\ filtered ) for

                    -- css styling properties for svg
                    { type : "property", for :[], linkingText } | ns == SVG -> do
                        let members = Array.mapMaybe mkAttribute linkingText
                        [ "SvgGlobal" /\ members ]

                    { type : "property", for, linkingText } | ns == SVG -> do
                        let members = Array.mapMaybe mkAttribute linkingText
                        map ( ( _ /\ members ) <<< tagToInterface ns ) for

                    _ ->
                        []
            where

            -- | Converts the property name of the ARIAMixin interface to the corresponding attribute name
            unAria :: String -> String
            unAria prop = case String.stripPrefix ( String.Pattern "aria" ) prop of
                Nothing -> 
                    prop -- role is not prefixed with aria

                Just rawAttr -> case rawAttr of
                    _ | Just elementStripped <- String.stripSuffix ( String.Pattern "Element" ) rawAttr ->
                        "aria-" <> String.toLower elementStripped

                    _ | Just elementsStripped <- String.stripSuffix ( String.Pattern "Elements" ) rawAttr ->
                        "aria-" <> String.toLower elementsStripped

                    _ ->
                        "aria-" <> String.toLower rawAttr
        
        elementInterfaces :: Foreign.Object ( Array Attribute )
        elementInterfaces =
            Foreign.fromFoldable $ map (\{ interface : Ctor intf } -> intf /\ [] ) elements

        interfaces :: Array Interface
        interfaces = do
            let
                referenced :: Array String
                referenced =
                    Foreign.keys elementInterfaces <> namespaceBases ns

                filtered :: Array ( String /\ Array Attribute )    
                filtered =
                    Foreign.toUnfoldable
                        $ Foreign.filterKeys ( _ `Array.elem` referenced )
                        $ Foreign.union interfaceMembers elementInterfaces
            
            flip Array.mapMaybe filtered \( name /\ members ) ->
                mkInterface ns name members
                
    { keywords
    , elements
    , interfaces
    }

-- | Intermediate type between `IDLType` and `Type Void` so we can generate an `Ord` and `Eq` instance for deduping. 
data TypeStub 
    = TypeInt
    | TypeString
    | TypeBoolean
    | TypeNumber
    | TypeEventHandler
    | TypeKeyword String
    | TypeUnit
    | TypeSelfHandler
derive instance Eq TypeStub
derive instance Ord TypeStub
derive instance Generic TypeStub _

construct :: forall e . TypeStub -> Type e
construct = unsafePartial case _ of
    TypeInt -> typeCtor "Int"
    TypeString -> typeCtor "String"
    TypeBoolean -> typeCtor "Boolean"
    TypeNumber -> typeCtor "Number"
    
    TypeEventHandler ->
        typeArrow
            [ typeCtor "Web.Event.Internal.Types.Event" ]
            $ typeApp ( typeCtor "Effect.Effect" ) [ typeCtor "Data.Unit.Unit" ]
    
    TypeKeyword ix ->
        typeApp ( typeCtor "Index.Keyword" ) [ typeString ix ]
    
    TypeUnit ->
        typeCtor "Data.Unit.Unit"

-- | Generates the necessary imports for the given types.
typeImports :: forall e . Array TypeStub -> Array ( ImportDecl e )
typeImports stubs =
    unsafePartial $ flip map ( Array.nub $ bind stubs modules ) \mod ->
        declImportAs mod [] mod

    where

    modules = case _ of
        TypeInt -> [ "Deku.Attribute", "Data.Show" ] -- prop', show
        TypeString -> [ "Deku.Attribute" ] -- prop'
        TypeBoolean -> [ "Deku.Attribute", "Data.Show" ] -- prop', show
        TypeNumber -> [ "Deku.Attribute", "Data.Show" ] -- prop', show
        TypeEventHandler ->
            [ "Effect" -- Effect
            , "Web.Event.Internal.Types" -- Event
            , "Data.Unit" -- Unit
            , "Deku.Attribute" -- cb, cb'
            ]
        TypeKeyword _ ->
            [ "Deku.Attribute", "Data.Newtype" ] -- unwrap
        
        TypeUnit ->
            [ "Deku.Attribute", "Data.Unit" ] -- unset'

        TypeSelfHandler ->
            [ "Effect" -- Effect
            , "Data.Unit" -- Unit
            , "Deku.Attribute" -- cb, Cb
            , "Unsafe.Coerce" -- unsafeCoerce
            ]


handler :: forall e . TypeStub -> Array ( BinaryOp ( Expr e ) ) 
handler = unsafePartial case _ of
    TypeInt ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'"
        , binaryOp "<<<" $ exprIdent "Data.Show.show"
        ]
    
    TypeString ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'" ]

    TypeBoolean ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'"
        , binaryOp "<<<" $ exprIdent "Data.Show.show"
        ]

    TypeNumber ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'"
        , binaryOp "<<<" $ exprIdent "Data.Show.show"
        ]
    
    TypeEventHandler ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.cb'"
        , binaryOp "<<<" $ exprIdent "Deku.Attribute.cb"
        ]

    TypeKeyword _ ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'"
        , binaryOp "<<<" $ exprIdent "Data.Newtype.unwrap"
        ]

    TypeSelfHandler ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.cb'"
        , binaryOp "<<<" $ exprCtor "Deku.Attribute.Cb"
        , binaryOp "<<<" $ exprIdent "Unsafe.Coerce.unsafeCoerce" 
        ]

declHandler :: String -> String -> Array ( BinaryOp ( Expr Void ) ) -> Declaration Void
declHandler name key ops =
    unsafePartial
        $ declValue name []
        $ exprApp ( exprIdent "Functor.map" ) [ exprHandler key ops ]

exprHandler :: Partial => String -> Array ( BinaryOp ( Expr Void ) ) -> Expr Void
exprHandler key ops =
    exprOp ( exprIdent "Deku.Attribute.unsafeAttribute" )
        $ Array.cons ( binaryOp "<<<" $ exprRecord [ "key" /\ exprString key, "value" /\ exprSection ] ) ops

typeArrayed :: Type Void -> Type Void
typeArrayed t = 
    unsafePartial $ typeApp ( typeCtor "Array" ) $ pure t

typeEvented :: Type Void -> Type Void
typeEvented t =
    unsafePartial $ typeApp ( typeCtor "FRP.Event.Event" ) $ pure t

typeAttributed :: Type Void -> Type Void
typeAttributed t =
    unsafePartial $ typeApp ( typeCtor "Deku.Attribute.Attribute" ) $ pure t

typeNut :: Type Void
typeNut =
    unsafePartial $ typeCtor "Nut"

selfKey :: String
selfKey =
    "@self@"
    
-- | Elements that have an implementation in the current web-html package
webElements :: Array String
webElements =
    [ "HTMLAnchorElement"
    , "HTMLAreaElement"
    , "HTMLAudioElement"
    , "HTMLBRElement"
    , "HTMLBaseElement"
    , "HTMLBodyElement"
    , "HTMLButtonElement"
    , "HTMLCanvasElement"
    , "HTMLDivElement"
    , "HTMLEmbedElement"
    , "HTMLFormElement"
    , "HTMLHRElement"
    , "HTMLHeadElement"
    , "HTMLHtmlElement"
    , "HTMLInputElement"
    , "HTMLLabelElement"
    , "HTMLLegendElement"
    , "HTMLLinkElement"
    , "HTMLMapElement"
    , "HTMLMetaElement"
    , "HTMLMeterElement"
    , "HTMLObjectElement"
    , "HTMLOptionElement"
    , "HTMLOutputElement"
    , "HTMLParagraphElement"
    , "HTMLParamElement"
    , "HTMLPreElement"
    , "HTMLProgressElement"
    , "HTMLScriptElement"
    , "HTMLSelectElement"
    , "HTMLSourceElement"
    , "HTMLSpanElement"
    , "HTMLStyleElement"
    , "HTMLTableDataCellElement"
    , "HTMLTableElement"
    , "HTMLTemplateElement"
    , "HTMLTextAreaElement"
    , "HTMLTimeElement"
    , "HTMLTitleElement"
    , "HTMLTrackElement"
    , "HTMLVideoElement"
    ]