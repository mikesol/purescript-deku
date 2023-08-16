module DOM.Common where

import Prelude
import Prim hiding (Type)

import Data.Array as Array
import Data.Foldable (foldl)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, un)
import Data.Set (Set)
import Data.Set as Set
import Data.String as String
import Data.String.CodeUnits as CU
import Data.Tuple.Nested ((/\))
import DOM.TypeStub(TypeStub(..))
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, Expr, Ident(..), Label, Proper(..), Type)
import Safe.Coerce (coerce)
import Tidy.Codegen (binaryOp, declValue, exprApp, exprIdent, exprOp, exprRecord, exprSection, exprString, typeApp, typeCtor)
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
    Just { name : name, index: Ctor $ "on" <> capitalize ( unSnake name ), type : TypeEventEffect }

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