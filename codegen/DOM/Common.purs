module DOM.Common where

import Prelude

import DOM.Spec (IDL, Interface, Mixin(..))
import Data.Array as Array
import Data.Foldable (foldl)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Set (Set)
import Data.Set as Set
import Data.String as String
import Data.String.CodeUnits as CU
import Data.Tuple (snd)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign

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

crawlInterfaces :: IDL -> Set String -> Set String -> Array String
crawlInterfaces _ seen next | Set.isEmpty next = Set.toUnfoldable seen
crawlInterfaces spec seen next = do
    let found :: Set String
        found = Set.fromFoldable $ Array.foldMap ( maybe [] snd <<< resolveInterface spec ) $ Set.toUnfoldable next
    
    crawlInterfaces spec ( Set.union seen found ) ( Set.difference found seen )

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
