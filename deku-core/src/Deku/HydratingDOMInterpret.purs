module Deku.HydratingDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2)
import Data.Array as Array
import Data.Array.NonEmpty (NonEmptyArray, toArray)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (class Newtype, un)
import Data.Traversable (traverse)
import Debug (spy)
import Deku.Core (Attribute', MakeElement, MakeText)
import Deku.Core as Core
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.Internal.Entities (toDekuElement, toDekuText)
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn1, mkEffectFn2, mkEffectFn3, mkEffectFn4, runEffectFn3)
import Effect.Unsafe (unsafePerformEffect)
import FRP.Poll (Poll)
import Foreign.Object (Object)
import Foreign.Object as Object
import Web.DOM as Web.DOM
import Web.DOM.Node (nodeValue)
import Web.DOM.ParentNode (QuerySelector(..), querySelector)
import Web.DOM.Text (toNode)

newtype HydrationRenderingInfo = HydrationRenderingInfo
  { attributeIndicesThatAreNeededDuringHydration :: Maybe (NonEmptyArray Int)
  , hasParentThatWouldDisqualifyFromSSR :: Boolean
  , hasChildrenThatWouldDisqualifyFromSSR :: Boolean
  , isBoring :: Boolean
  }

derive instance Newtype HydrationRenderingInfo _

makeElement
  :: Object HydrationRenderingInfo
  -> Web.DOM.Element
  -> Web.DOM.ParentNode
  -> MakeElement
makeElement renderingInfo dummyElement parentNode = mkEffectFn3 \id ns tag -> do
  let idS = show id
  let ri = Object.lookup idS renderingInfo
  let createNew = runEffectFn3 I.makeElementEffect id ns tag
  case ri of
    -- shouldn't happen
    Nothing -> do
          let _ = spy "hydratingDOMInterpret:programming error - rendering info not found: " idS
          createNew
    Just (HydrationRenderingInfo value) -> do
      case
        value.hasParentThatWouldDisqualifyFromSSR
          || value.hasChildrenThatWouldDisqualifyFromSSR
          || value.attributeIndicesThatAreNeededDuringHydration /= Nothing
        of
        true -> do
          sel <- querySelector
            (QuerySelector $ "[data-deku-ssr=\"" <> idS <> "\"]")
            parentNode
          case sel of
            -- shouldn't happen
            Nothing -> do
                let _ = spy "hydratingDOMInterpret:programming error - selector not found: " idS
                createNew
            Just el -> do
                let _ = spy "hydratingDOMInterpret:makeElement:foundElement" idS
                pure $ toDekuElement el
        false -> do
            let _ = spy "hydratingDOMInterpret:elt unneeded" idS
            pure $ toDekuElement dummyElement

makeText :: Object Web.DOM.Text -> Web.DOM.Text -> MakeText
makeText textNodeCache dummyText = mkEffectFn3 \id _ _ -> pure $ toDekuText
  let _ = spy "looking up text" {id, lookup: Object.lookup (show id) textNodeCache} in
  case Object.lookup (show id) textNodeCache of
    Nothing -> dummyText
    Just t -> let ____ = spy "and here is what it says" (unsafePerformEffect $ nodeValue $ toNode t)  in t

hydratingDOMInterpret
  :: ST.ST Global Int
  -> Object HydrationRenderingInfo
  -> Object Web.DOM.Text
  -> Web.DOM.Text
  -> Web.DOM.Element
  -> Web.DOM.ParentNode
  -> Core.DOMInterpret
hydratingDOMInterpret
  tagger
  renderingInfo
  textNodeCache
  dummyText
  dummyElement
  parentNode =
  Core.DOMInterpret
    { tagger
    -- we could likely make `dynamicDOMInterpret` a no-op
    -- should be harmless, though, as this will be called rarely if at all
    -- because SSR code will only trigger dynamic elements
    -- in case there's a dyn with pure polls that aren't optimized as being pure
    , dynamicDOMInterpret: \_ -> fullDOMInterpret tagger
    --
    , isBoring: \tag ->
        maybe false (un HydrationRenderingInfo >>> _.isBoring) $ Object.lookup
          (show tag)
          renderingInfo
    , registerParentChildRelationship: mkSTFn2 \_ _ -> pure unit
    , makeElement: makeElement renderingInfo dummyElement parentNode
    -- attachments should never happen during hydration
    -- the dynamicDOMInterpret should always kick in
    -- when an attachment actually needs to occur
    -- so we make it a noop
    , attachElement: mkEffectFn2 \_ _ -> pure unit
    , incrementElementCount: mkSTFn1 \_ -> pure unit
    , disqualifyFromStaticRendering: mkSTFn1 \_ -> pure unit
    , setProp: I.setPropEffect
    , setCb: I.setCbEffect
    , unsetAttribute: I.unsetAttributeEffect
    , removeElement: I.removeElementEffect
    , makeText: makeText textNodeCache dummyText
    , attachText: mkEffectFn2 \_ _ -> pure unit
    -- text setting should never happen during hydration
    , setText: mkEffectFn4 \_ _ _ _ -> pure unit
    , removeText: I.removeTextEffect
    , incrementPureTextCount: mkSTFn1 \_ -> pure unit
    --
    , beamRegion: I.beamRegionEffect
    , bufferPortal: I.bufferPortal
    }