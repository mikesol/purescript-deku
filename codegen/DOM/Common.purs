module DOM.Common where

import Prelude
import Prim hiding (Type)

import DOM.Spec (IDL, IDLType(..), Interface, Member(..), Mixin(..), Tag)
import Data.Array as Array
import Data.Foldable (foldl)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Set (Set)
import Data.Set as Set
import Data.String as String
import Data.String.CodeUnits as CU
import Data.Tuple.Nested (type (/\), (/\))
import Debug as Debug
import Foreign.Object as Foreign
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Expr, ImportDecl, Type)
import Tidy.Codegen (binaryOp, declImportAs, exprIdent, exprOp, typeApp, typeArrow, typeCtor, typeString)

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

-- | Interfaces which should not show up in generated code because they have not been implemented yet.
correctionInterfaces :: String -> Maybe String
correctionInterfaces = case _ of
    "LinkStyle" -> Nothing
    
    id -> Just id

correctionKeyword :: String -> Maybe ( String /\ String )
correctionKeyword = case _ of
    "section-" -> Nothing
    "1" -> Just ( "x1" /\ "1" )
    "A" -> Just ( "xA" /\ "A" )
    "I" -> Just ( "xI" /\ "I" )

    id -> Just ( unSnake id /\ id )

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
        
validTag :: Tag -> Maybe ( String /\ String )
validTag { obsolete : Just true } = Nothing
validTag { interface : Nothing } = Nothing
validTag { interface : Just interface, name } = Just $ name /\ interface

attributeMember :: Member -> Array ( String /\ IDLType )
attributeMember = case _ of
        -- only emit writeable(not readonly attributes)
        Attribute { idlType, name : attrName, readonly } | maybe true not readonly ->
            [ attrName /\ idlType ]
        
        _ ->
            []

unSnake :: String -> String
unSnake =
    _.acc
        <<< foldl
            (\{ dropped, acc } c -> case dropped, c of
                _, '-' -> { dropped : true, acc }
                _, ' ' -> { dropped : true, acc }
                _, '/' -> { dropped : true, acc }
                true, _ -> { dropped : false, acc : acc <> ( String.toUpper $ CU.singleton c ) }
                _, _ ->
                    { dropped : false, acc : acc <> CU.singleton c }
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

-- | Looks up an interface and returns all inherited and mixed in interfaces.
resolveInterface :: IDL -> String -> Maybe ( Interface /\ Array String )
resolveInterface spec name = do
    let mixins =
            Array.mapMaybe included 
                $ fromMaybe []
                $ Foreign.lookup name spec.idlExtendedNames

    intf <- Foreign.lookup name spec.idlNames
    let
        bases :: Array String
        bases =
            Array.mapMaybe correctionInterfaces
                $ maybe mixins ( Array.snoc mixins ) intf.inheritance 
    
    pure $ intf /\ bases

    where

    included = case _ of
        Includes { includes } ->
            Just includes
        
        _ ->
            Nothing

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

construct :: forall e . TypeStub -> Type e
construct = unsafePartial case _ of
    TypeInt -> typeCtor "Int"
    TypeString -> typeCtor "String"
    TypeBoolean -> typeCtor "Boolean"
    TypeNumber -> typeCtor "Number"
    TypeEventHandler -> typeArrow [ typeCtor "Web.DOM.Event" ] $ typeApp ( typeCtor "Effect.Effect" ) [ typeCtor "Data.Unit.Unit" ]
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
            , "Web.DOM" -- Event
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
        exprOp ( exprIdent "prop'" ) [ binaryOp "<<<" $ exprIdent "Show.show" ] 
    
    TypeString ->
        exprIdent "prop'"
    
    TypeBoolean ->
        exprOp ( exprIdent "prop'" ) [ binaryOp "<<<" $ exprIdent "Show.show" ] 
    
    TypeNumber ->
        exprOp ( exprIdent "prop'" ) [ binaryOp "<<<" $ exprIdent "Show.show" ] 
    
    TypeEventHandler ->
        unsafePartial $ exprOp ( exprIdent "cb'" ) [ binaryOp "<<<" $ exprIdent "cb" ]

    TypeKeyword _ ->
        exprOp ( exprIdent "prop'" ) [ binaryOp "<<<" $ exprIdent "Newtype.unwrap" ]

mapType :: IDLType -> Array TypeStub
mapType = case _ of
    Descriptor t -> mapType t.idlType

    Primitive "boolean" ->
        pure TypeBoolean
    
    Primitive "long" ->
        pure TypeInt

    Primitive "unsigned long" ->
        pure TypeInt

    Primitive "long long" ->
        pure TypeInt
    
    Primitive "unsigned long long" -> 
        pure TypeInt

    Primitive "unsigned short" ->
        pure TypeInt

    Primitive "double" -> 
        pure TypeNumber

    Primitive "unrestricted double" ->
        pure TypeNumber
        
    Primitive "Number" ->
        pure TypeNumber

    Primitive "SVGAnimatedNumber" ->
        pure TypeNumber

    Primitive "EventHandler" ->
        pure TypeEventHandler

    Primitive "any" ->
        pure TypeString

    Primitive "DOMString" ->
        pure TypeString

    Primitive "DOMTokenList" ->
        pure TypeString

    Primitive "USVString" ->
        pure TypeString

    Primitive "SVGAnimatedEnumeration" ->
        pure TypeString

    Union s ->
        bind s mapType

    Primitive t ->
        []

-- | Elements that have an implementation in the current web-html package
webElements :: Set String
webElements =
    Set.fromFoldable
        [ "Element"
        , "HTMLElement"
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
