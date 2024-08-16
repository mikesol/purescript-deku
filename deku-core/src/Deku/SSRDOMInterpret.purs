module Deku.SSRDOMInterpret where

import Prelude

import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as STRef
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, mkSTFn1, mkSTFn2, mkSTFn3, runSTFn3)
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, over)
import Data.Set as Set
import Data.Tuple (Tuple(..))
import Deku.Core as Core
import Deku.Internal.Ancestry (Ancestry)
import Deku.Internal.Entities (DekuElement, DekuText, fromDekuElement)
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn1, mkEffectFn2, mkEffectFn3, runEffectFn3)
import Web.DOM.Element (setAttribute)

updateRenderingInfo
  :: forall k a
   . Ord k
  => STFn3 k (a -> a)
       (STRef.STRef Global (Map.Map k a))
       Global
       Unit
updateRenderingInfo = mkSTFn3 \id fn renderingInfo -> do
  void $ STRef.modify (Map.alter (map fn) id) renderingInfo

type SSRElementRenderingInfoCache = Map.Map Ancestry SSRElementRenderingInfo

newtype SSRElementRenderingInfo = SSRElementRenderingInfo
  { isImpure :: Boolean
  , ancestry :: Ancestry
  , backingElement :: DekuElement
  }

derive instance Newtype SSRElementRenderingInfo _

initializeElementRendering
  :: STRef.STRef Global SSRElementRenderingInfoCache
  -> STFn2 Ancestry DekuElement Global Unit
initializeElementRendering renderingInfo = mkSTFn2
  \ancestry backingElement -> do
    void $ STRef.modify
      ( Map.alter
          ( const $ Just $ SSRElementRenderingInfo
              { isImpure: false
              , ancestry
              , backingElement
              }
          )
          ancestry
      )
      renderingInfo

markTextAsImpure
  :: STRef.STRef Global SSRTextRenderingInfoCache
  -> STFn1 Ancestry Global Unit
markTextAsImpure renderingInfo = mkSTFn1 \id -> do
  runSTFn3 updateRenderingInfo id f renderingInfo
  where
  f = over SSRTextRenderingInfo \r -> r
    { isImpure = true
    }

markElementAsImpure
  :: STRef.STRef Global SSRElementRenderingInfoCache
  -> STFn1 Ancestry Global Unit
markElementAsImpure renderingInfo = mkSTFn1 \id -> do
  runSTFn3 updateRenderingInfo id f renderingInfo
  where
  f = over SSRElementRenderingInfo \r -> r
    { isImpure = true
    }

type SSRTextRenderingInfoCache = Map.Map Ancestry SSRTextRenderingInfo

newtype SSRTextRenderingInfo = SSRTextRenderingInfo
  { ancestry :: Ancestry
  , isImpure :: Boolean
  , backingText :: DekuText
  }

derive instance Newtype SSRTextRenderingInfo _

initializeTextRendering
  :: STRef.STRef Global SSRTextRenderingInfoCache
  -> STFn2 Ancestry DekuText Global Unit
initializeTextRendering renderingInfo = mkSTFn2
  \ancestry backingText -> do
    void $ STRef.modify
      ( Map.alter
          ( const $ Just $ SSRTextRenderingInfo
              { ancestry
              , isImpure: false
              , backingText
              }
          )
          ancestry
      )
      renderingInfo

ssrDOMInterpret
  :: STRef.STRef Global Int
  -> STRef.STRef Global SSRTextRenderingInfoCache
  -> STRef.STRef Global SSRElementRenderingInfoCache
  -> STRef.STRef Global (Set.Set Ancestry)
  -> STRef.STRef Global (Set.Set Ancestry)
  -> STRef.STRef Global (Set.Set Ancestry)
  -> STRef.STRef Global (Set.Set Ancestry)
  -> Core.DOMInterpret
ssrDOMInterpret
  portalRef
  textRenderingInfo
  elementRenderingInfo
  purePortalCache
  portalCache
  dynCache
  fixedCache =
  Core.DOMInterpret
    { dynamicDOMInterpret: \_ -> noOpDomInterpret
    , portalDOMInterpret: \_ -> ssrDOMInterpret portalRef textRenderingInfo
        elementRenderingInfo
        purePortalCache
        portalCache
        dynCache
        fixedCache
    --
    , isBoring: const false
    , makeElement: I.makeElementEffect
    , attachElement: I.attachElementEffect
    , initializeElementRendering: initializeElementRendering
        elementRenderingInfo
    , markElementAsImpure: markElementAsImpure
        elementRenderingInfo
    , setProp: mkEffectFn3 \a@(Core.Key k) b@(Core.Value v) elt' -> do
        -- innerHTML doesn't show values
        -- so we set it this way and then sub it out later
        let elt = fromDekuElement elt'
        when (k == "value") do
          setAttribute "data-deku-value" v elt
        runEffectFn3 I.setPropEffect a b elt'
    , setCb: I.setCbEffect
    , unsetAttribute: I.unsetAttributeEffect
    , removeElement: I.removeElementEffect
    --
    , makeText: I.makeTextEffect
    , attachText: I.attachTextEffect
    , setText: I.setTextEffect
    , removeText: I.removeTextEffect
    , initializeTextRendering: initializeTextRendering textRenderingInfo
    , markTextAsImpure: markTextAsImpure textRenderingInfo
    --
    , beamRegion: I.beamRegionEffect
    , bufferPortal: do
        i <- liftST $ STRef.modify (_ + 1) portalRef
        Tuple _ p <- I.bufferPortal
        pure $ Tuple i p
    , markPortalAsRendered: mkSTFn1 \a -> void $ STRef.modify (Set.insert a)
        purePortalCache
    , initializePortalRendering: mkSTFn1 \a -> void $ STRef.modify
        (Set.insert a)
        portalCache
    , initializeDynRendering: mkSTFn1 \a -> void $ STRef.modify (Set.insert a)
        dynCache
    , initializeFixedRendering: mkSTFn1 \a -> void $ STRef.modify (Set.insert a)
        fixedCache
    , setInnerHTML: I.setInnerHtmlEffect

    }

noOpDomInterpret
  :: Core.DOMInterpret
noOpDomInterpret =
  Core.DOMInterpret
    { -- we could likely make `dynamicDOMInterpret` a no-op
      -- should be harmless, though, as this will be called rarely if at all
      -- because SSR code will only trigger dynamic elements
      -- in case there's a dyn with pure polls that aren't optimized as being pure
      dynamicDOMInterpret: \_ -> noOpDomInterpret
    , portalDOMInterpret: \_ -> noOpDomInterpret
    --
    , isBoring: const false
    , markElementAsImpure: mkSTFn1 \_ -> pure unit
    , makeElement: I.makeElementEffect
    , attachElement: mkEffectFn2 \_ _ -> pure unit
    , initializeElementRendering: mkSTFn2 \_ _ -> pure unit
    , initializeTextRendering: mkSTFn2 \_ _ -> pure unit
    , setProp: mkEffectFn3 \_ _ _ -> pure unit
    , setCb: mkEffectFn3 \_ _ _ -> pure unit
    , unsetAttribute: mkEffectFn2 \_ _ -> pure unit
    , removeElement: mkEffectFn1 \_ -> pure unit
    --
    , makeText: I.makeTextEffect
    , attachText: mkEffectFn2 \_ _ -> pure unit
    , setText: mkEffectFn2 \_ _ -> pure unit
    , removeText: mkEffectFn1 \_ -> pure unit
    , markTextAsImpure: mkSTFn1 \_ -> pure unit
    --
    , beamRegion: mkEffectFn3 \_ _ _ -> pure unit
    , markPortalAsRendered: mkSTFn1 \_ -> pure unit
    , bufferPortal: I.bufferPortal
    , initializePortalRendering: mkSTFn1 \_ -> pure unit
    , initializeDynRendering: mkSTFn1 \_ -> pure unit
    , initializeFixedRendering: mkSTFn1 \_ -> pure unit
    , setInnerHTML: mkEffectFn2 \_ _ -> pure unit
    }