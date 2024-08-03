module Deku.HydratingDOMInterpret
  ( HydrationRenderingInfo(..)
  , hydratingDOMInterpret
  , makeElement
  , makeText
  ) where

import Prelude

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as STRef
import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2)
import Data.Map as Map
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (class Newtype, un)
import Data.Set as Set
import Data.Tuple (Tuple(..))
import Deku.Core (MakeElement, MakeText)
import Deku.Core as Core
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.Internal.Ancestry (Ancestry)
import Deku.Internal.Entities (toDekuElement, toDekuText)
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn2, mkEffectFn3)
import Web.DOM as Web.DOM

newtype HydrationRenderingInfo = HydrationRenderingInfo
  { isImpure :: Boolean
  , isBoring :: Boolean
  , backingElement :: Web.DOM.Element
  }

derive instance Newtype HydrationRenderingInfo _

makeElement
  :: Map.Map Ancestry HydrationRenderingInfo
  -> MakeElement
makeElement renderingInfo = mkEffectFn3 \id _ _ -> do
  let ri = Map.lookup id renderingInfo
  case ri of
    Nothing -> pure $ toDekuElement unit -- force crash
    Just (HydrationRenderingInfo value) -> pure $ toDekuElement
      value.backingElement

makeText :: Map.Map Ancestry Web.DOM.Text -> MakeText
makeText textNodeCache = mkEffectFn2 \id _ ->
  case Map.lookup id textNodeCache of
    Nothing -> pure $ toDekuText unit -- force crash
    Just t -> pure $ toDekuText t

hydratingDOMInterpret
  :: STRef.STRef Global Int
  -> Map.Map Ancestry HydrationRenderingInfo
  -> Map.Map Ancestry Web.DOM.Text
  -> Set.Set Ancestry
  -> Core.DOMInterpret
hydratingDOMInterpret
  portalRef
  renderingInfo
  textNodeCache
  renderedPortals =
  Core.DOMInterpret
    {
      -- we could likely make `dynamicDOMInterpret` a no-op
      -- should be harmless, though, as this will be called rarely if at all
      -- because SSR code will only trigger dynamic elements
      -- in case there's a dyn with pure polls that aren't optimized as being pure
      dynamicDOMInterpret: \_ -> fullDOMInterpret
    , portalDOMInterpret: \a ->
        if Set.member a renderedPortals then hydratingDOMInterpret portalRef
          renderingInfo
          textNodeCache
          renderedPortals
        else fullDOMInterpret
    --
    , isBoring: \tag ->
        maybe false (un HydrationRenderingInfo >>> _.isBoring) $ Map.lookup
          tag
          renderingInfo
    , makeElement: makeElement renderingInfo
    -- attachments should never happen during hydration
    -- the dynamicDOMInterpret should always kick in
    -- when an attachment actually needs to occur
    -- so we make it a noop
    , attachElement: mkEffectFn2 \_ _ -> pure unit
    , initializeElementRendering: mkSTFn2 \_ _ -> pure unit
    , initializeTextRendering: mkSTFn2 \_ _ -> pure unit
    , markElementAsImpure: mkSTFn1 \_ -> pure unit
    , setProp: mkEffectFn3 \_ _ _ -> pure unit
    , setCb: I.setCbEffect
    , unsetAttribute: I.unsetAttributeEffect
    , removeElement: I.removeElementEffect
    , makeText: makeText textNodeCache
    , attachText: mkEffectFn2 \_ _ -> pure unit
    , setText: mkEffectFn2 \_ _ -> pure unit
    , removeText: I.removeTextEffect
    , markTextAsImpure: mkSTFn1 \_ -> pure unit
    --
    , beamRegion: I.beamRegionEffect
    , markPortalAsRendered: mkSTFn1 \_ -> pure unit
    , bufferPortal: do
        i <- liftST $ STRef.modify (_ + 1) portalRef
        Tuple _ p <- I.bufferPortal
        pure $ Tuple i p
    , initializePortalRendering: mkSTFn1 \_ -> pure unit
    , initializeDynRendering: mkSTFn1 \_ -> pure unit
    , initializeFixedRendering: mkSTFn1 \_ -> pure unit
    }