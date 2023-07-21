module DOM.Common where

import Prelude
import Prim hiding (Type)

import DOM.Spec (Definition)
import Data.Array as Array
import Data.Foldable (foldl)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..), isJust)
import Data.Newtype (class Newtype, un)
import Data.Set (Set)
import Data.Set as Set
import Data.String as String
import Data.String.CodeUnits as CU
import Data.Tuple (uncurry)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Expr, Ident(..), ImportDecl, Label, Proper(..), Type)
import Safe.Coerce (coerce)
import Tidy.Codegen (binaryOp, declImportAs, exprIdent, exprOp, typeApp, typeArrow, typeCtor, typeString)
import Tidy.Codegen.Class (class ToName, class ToQualifiedName, defaultToName, toName, toQualifiedName)
import Tidy.Codegen.Types (Qualified(..))

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

mkAttribute :: TypeStub -> String -> Maybe Attribute
mkAttribute t name =
    Just { name, index : Ctor $ unSnake name, type : t }

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
tagToInterface ns tag = do
    let formatted = ( capitalize $ unSnake tag )
    if formatted `Array.elem` baseInterfaces then
        formatted
    else
        prefix <> ( capitalize $ unSnake tag ) <> "Element"
    
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

-- | Applies camel-case to string starting with "on".
camelCaseOn :: String -> String
camelCaseOn haystack =
    case String.stripPrefix ( String.Pattern "on" ) haystack of
        Just needle ->
            "on" <> capitalize needle

        Nothing  ->
            haystack


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

-- | 
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
                            filtered = flip Array.mapMaybe linkingText \attr -> do
                                let typeHint =
                                        if isJust $ String.stripPrefix ( String.Pattern "on" ) attr then
                                            TypeEventHandler
                                        else
                                            TypeString
                                
                                mkAttribute typeHint attr
                        
                        map ( ( _ /\  filtered ) <<< tagToInterface ns ) for

                    -- could not find a definition for aria attributes so we translate the properties instead
                    { type : "attribute", for : [ "ARIAMixin" ], linkingText } -> do
                        [ "ARIAMixin" /\ Array.mapMaybe ( mkAttribute TypeString <<< unAria ) linkingText ]
                    
                    -- detect event handler attributes
                    { type : "attribute", for, linkingText } -> do
                        let filtered =
                                flip Array.mapMaybe linkingText
                                    $ mkAttribute TypeEventHandler
                                    <=< pure <<< append "on" <<< capitalize
                                    <=< String.stripPrefix ( String.Pattern "on" )
                        
                        if filtered == [] then [] else map ( _ /\ filtered ) for

                    -- css styling properties for svg
                    { type : "property", for :[], linkingText } | ns == SVG -> do
                        let members = Array.mapMaybe ( mkAttribute TypeString ) linkingText
                        [ "SvgGlobal" /\ members ]

                    { type : "property", for, linkingText } | ns == SVG -> do
                        let members = Array.mapMaybe ( mkAttribute TypeString ) linkingText
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
    
    TypeKeyword ix -> typeApp ( typeCtor "Keyword" ) [ typeString ix ]
    TypeUnit ->
        typeCtor "Unit"

-- | Generates the necessary imports for the given types.
typeImports :: forall e . Array TypeStub -> Array ( ImportDecl e )
typeImports stubs =
    unsafePartial $ flip map ( Set.toUnfoldable imports ) \mod ->
        declImportAs mod [] mod

    where

    imports = Set.fromFoldable $ bind stubs modules

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

handler :: forall e . TypeStub -> Expr e 
handler = unsafePartial case _ of
    TypeInt ->
        exprOp ( exprIdent "Deku.Attribute.prop'" ) [ binaryOp "<<<" $ exprIdent "Data.Show.show" ] 
    
    TypeString ->
        exprIdent "Deku.Attribute.prop'"
    
    TypeBoolean ->
        exprOp ( exprIdent "Deku.Attribute.prop'" ) [ binaryOp "<<<" $ exprIdent "Data.Show.show" ] 
    
    TypeNumber ->
        exprOp ( exprIdent "Deku.Attribute.prop'" ) [ binaryOp "<<<" $ exprIdent "Data.Show.show" ] 
    
    TypeEventHandler ->
        unsafePartial $ exprOp ( exprIdent "Deku.Attribute.cb'" ) [ binaryOp "<<<" $ exprIdent "Deku.Attribute.cb" ]

    TypeKeyword _ ->
        exprOp ( exprIdent "Deku.Attribute.prop'" ) [ binaryOp "<<<" $ exprIdent "Data.Newtype.unwrap" ]

typeArrayed :: Type Void -> Type Void
typeArrayed t = 
    unsafePartial $ typeApp ( typeCtor "Array" ) $ pure t

typeEvented :: Type Void -> Type Void
typeEvented t =
    unsafePartial $ typeApp ( typeCtor "Event" ) $ pure t

typeAttributed :: Type Void -> Type Void
typeAttributed t =
    unsafePartial $ typeApp ( typeCtor "Attribute" ) $ pure t

typeNut :: Type Void
typeNut =
    unsafePartial $ typeCtor "Nut"

escapeBaseInterface :: String -> String /\ Ctor
escapeBaseInterface name =
    name /\ ( Ctor $ capitalize $ unSnake name ) 

-- | Elements that have an implementation in the current web-html package
webElements :: Set String
webElements =
    Set.fromFoldable
        [ "HTMLElement"
        , "HTMLAnchorElement"
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