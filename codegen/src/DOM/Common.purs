module DOM.Common where

import Prelude
import Prim hiding (Type)

import DOM.TypeStub (TypeStub(..))
import Data.Array as Array
import Data.Foldable (foldl)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, un)
import Data.Set (Set)
import Data.Set as Set
import Data.String (codePointFromChar)
import Data.String as String
import Data.String.CodeUnits as CU
import Data.Tuple.Nested (type (/\), (/\))
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, Expr, Ident(..), Label, Proper(..), Type)
import Safe.Coerce (coerce)
import Tidy.Codegen (binaryOp, declValue, exprApp, exprIdent, exprOp, exprRecord, exprSection, exprString, typeApp, typeCtor, typeRow, typeVar)
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
    , members :: Array ( Ctor /\ TypeStub )
    }

type Element =
    { ctor :: Ctor -- name in source
    , ns :: TagNS
    , tag :: String
    , interface :: Ctor
    }

type Event =
    { name :: String
    , index :: Ctor
    , type :: TypeStub
    }

type Attribute =
    { name :: String -- name in document
    , index :: Ctor -- name in source and row index
    , type :: TypeStub -- type of this attribute
    , keywords :: Array Keyword -- valid values for this attribute
    }

type Keyword =
    { original :: String
    , name :: String
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

-- | Creates a valid attribute definition. Invalid definitions get converted to `Nothing`.
mkAttribute :: Array String -> String -> Maybe Attribute
mkAttribute keywords name =
    Just
        { name
        , index : Ctor $ unSnake $ escape name
        , type : TypeString
        , keywords : flip map keywords case _ of
            "I" ->
                { original : "I", name : "UpperI" }
            
            "i" ->
                { original : "i", name : "LowerI" }

            "A" ->
                { original : "A", name : "UpperA" }

            "a" ->
                { original : "a", name : "LowerA" }

            original ->
                { original, name :  capitalize $ unSnake original }
        
        }

-- | Creates a valid event definition. Invalid definitions get converted to `Nothing`.
mkHandler :: String -> String -> Maybe Event
-- blur and focus have been defined multiple times, once in html.json and once in uievents.json, the one we care about
-- has type "FocusEvent"
mkHandler "Event" "blur" = Nothing
mkHandler "Event" "focus" = Nothing
mkHandler type_ name = case String.stripPrefix ( String.Pattern "DOM" ) name of
    Just mutEvent ->
        Just
            { name
            , index : Ctor $ "dom" <> mutEvent
            , type : webEvents type_
            } 
    
    _ ->
        Just
            { name : name
            , index: Ctor $ unSnake name
            , type : webEvents type_ 
            }

-- | Creates a valid element Invalid definitions get converted to `Nothing`.
mkElement :: TagNS -> String -> String -> Maybe Element
mkElement ns interface name =
    Just
        { ctor : Ctor $ unSnake $ escape name
        , ns : ns
        , tag : name
        , interface : Ctor interface
        }

-- | Creates a valid interface definition. Invalid definitions get converted to `Nothing`.
mkInterface :: Array String -> Array ( Ctor /\ TypeStub ) -> String -> Maybe Interface
mkInterface _ _ "LinkStyle" = Nothing -- does not seem to exist
mkInterface bases members name =
    Just { name, ctor : Ctor name, members, bases : coerce bases }

escape :: String -> String
escape n =
    if not $ Set.member n reserved then n else case String.uncons n of
        -- c -> k
        Just { head, tail } | head == c ->
            String.singleton k <> tail

        -- else prefix with x
        _ ->
            "x" <> n

    where

    c = codePointFromChar 'c'
    k = codePointFromChar 'k'

reserved :: Set String
reserved =
    Set.fromFoldable
        [ "data"
        , "if"
        , "in"
        , "class"
        , "type"
        , "module"
        ]

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

typePolled :: Type Void -> Type Void
typePolled t =
    unsafePartial $ typeApp ( typeCtor "FRP.Poll.Poll" ) $ pure t

typeFunked ::  String -> Type Void -> Type Void
typeFunked f t =
    unsafePartial $ typeApp ( typeVar f ) $ pure t

typeAttributed :: Type Void -> Type Void
typeAttributed t =
    unsafePartial $ typeApp ( typeCtor "Deku.Attribute.Attribute" ) $ pure t

typeNut :: Type Void
typeNut =
    unsafePartial $ typeCtor "Nut"

typeIndexedAt :: Ctor -> Type Void -> Type Void
typeIndexedAt n t =
    unsafePartial $ typeRow [ n /\ t ] $ Just $ typeVar "r"

nominal :: Ctor
nominal =
    Ctor "__tag"

selfKey :: String
selfKey =
    "@self@"
    
-- | Elements that have an implementation in the current web-html package.
webElements :: Array TypeStub
webElements = map (\intf -> TypeEvent intf ( "Web.HTML." <> intf ) )
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

-- | Looks up the name of an event interface name and returns the best fitting `TypeStub`.
webEvents :: String -> TypeStub
webEvents ev = case ev of
    "CompositionEvent" -> TypeEvent "CompositionEvent" "Web.UIEvent.CompositionEvent"
    "FocusEvent" -> TypeEvent "FocusEvent" "Web.UIEvent.FocusEvent"
    "MouseEvent" -> TypeEvent "MouseEvent" "Web.UIEvent.MouseEvent"
    "KeyboardEvent" -> TypeEvent "KeyboardEvent" "Web.UIEvent.KeyboardEvent"
    "UIEvent" -> TypeEvent "UIEvent" "Web.UIEvent.UIEvent"
    "DragEvent" -> TypeEvent "DragEvent" "Web.HTML.Event.DragEvent"
    "DragEvent" -> TypeEvent "DragEvent" "Web.HTML.Event.DragEvent"
    "TrackEvent" -> TypeEvent "TrackEvent" "Web.HTML.Event.TrackEvent"
    "PointerEvent" -> TypeEvent "PointerEvent" "Web.PointerEvent.PointerEvent"
    "TouchEvent" -> TypeEvent "TouchEvent" "Web.TouchEvent.TouchEvent"

    _ -> TypeEvent "Event" "Web.Event.Internal.Types"
