module Deku.HydratingDOMInterpret
  ( HydrationRenderingInfo(..)
  , hydratingDOMInterpret
  , makeElement
  , makeText
  )
  where

import Prelude

import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (class Newtype, un)
import Data.Set as Set
import Deku.Core (AttrIndex, MakeElement, MakeText)
import Deku.Core as Core
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.Internal.Ancestry (Ancestry)
import Deku.Internal.Entities (toDekuElement, toDekuText)
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn2, mkEffectFn3)
import Web.DOM as Web.DOM

newtype HydrationRenderingInfo = HydrationRenderingInfo
  { attributeIndicesThatAreNeededDuringHydration :: Set.Set AttrIndex
  , isBoring :: Boolean
  , backingElement :: Web.DOM.Element
  }

derive instance Newtype HydrationRenderingInfo _

makeElement
  :: Map.Map Ancestry HydrationRenderingInfo
  -> Web.DOM.Element
  -> MakeElement
makeElement renderingInfo dummyElement = mkEffectFn3 \id _ _ -> do
  let ri = Map.lookup id renderingInfo
  case ri of
    Nothing -> pure $ toDekuElement dummyElement
    Just (HydrationRenderingInfo value) -> pure $ toDekuElement value.backingElement

makeText :: Map.Map Ancestry Web.DOM.Text -> Web.DOM.Text -> MakeText
makeText textNodeCache dummyText = mkEffectFn2 \id _ -> pure $ toDekuText
  case Map.lookup id textNodeCache of
    Nothing -> dummyText
    Just t ->  t

shouldSkipAttribute
  :: Map.Map Ancestry HydrationRenderingInfo
  -> Ancestry
  -> AttrIndex
  -> Boolean
shouldSkipAttribute renderingInfo id ix = fromMaybe false do
  ri <- Map.lookup id renderingInfo
  pure $ not $ Set.member ix
    (un HydrationRenderingInfo ri).attributeIndicesThatAreNeededDuringHydration

hydratingDOMInterpret
  :: Map.Map Ancestry HydrationRenderingInfo
  -> Map.Map Ancestry Web.DOM.Text
  -> Web.DOM.Text
  -> Web.DOM.Element
  -> Core.DOMInterpret
hydratingDOMInterpret
  renderingInfo
  textNodeCache
  dummyText
  dummyElement =
  Core.DOMInterpret
    { 
    -- we could likely make `dynamicDOMInterpret` a no-op
    -- should be harmless, though, as this will be called rarely if at all
    -- because SSR code will only trigger dynamic elements
    -- in case there's a dyn with pure polls that aren't optimized as being pure
    dynamicDOMInterpret: \_ -> fullDOMInterpret
    --
    , isBoring: \tag ->
        maybe false (un HydrationRenderingInfo >>> _.isBoring) $ Map.lookup
          tag
          renderingInfo
    , makeElement: makeElement renderingInfo dummyElement
    -- attachments should never happen during hydration
    -- the dynamicDOMInterpret should always kick in
    -- when an attachment actually needs to occur
    -- so we make it a noop
    , attachElement: mkEffectFn2 \_ _ -> pure unit
    , initializeElementRendering: mkSTFn2 \_ _ -> pure unit
    , initializeTextRendering: mkSTFn2 \_ _ -> pure unit
    , markAttributeIndexForHydration: mkSTFn2 \_ _ -> pure unit
    , shouldSkipAttribute: shouldSkipAttribute renderingInfo
    , setProp: I.setPropEffect
    , setCb: I.setCbEffect
    , unsetAttribute: I.unsetAttributeEffect
    , removeElement: I.removeElementEffect
    , makeText: makeText textNodeCache dummyText
    , attachText: mkEffectFn2 \_ _ -> pure unit
    , setText: mkEffectFn2 \_ _ -> pure unit
    , removeText: I.removeTextEffect
    , markTextAsImpure: mkSTFn1 \_ -> pure unit
    --
    , beamRegion: I.beamRegionEffect
    , bufferPortal: I.bufferPortal
    }