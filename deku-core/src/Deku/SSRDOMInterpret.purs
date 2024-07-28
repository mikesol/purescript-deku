module Deku.SSRDOMInterpret where

import Prelude

import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as STRef
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, mkSTFn1, mkSTFn2, mkSTFn3, runSTFn3)
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, over)
import Data.Set (Set)
import Data.Set as Set
import Deku.Core (AttrIndex)
import Deku.Core as Core
import Deku.Internal.Ancestry (Ancestry)
import Deku.Internal.Entities (DekuElement, DekuText)
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn1, mkEffectFn2, mkEffectFn3)

data SerializableSSRRenderingInfo
  = SerializableSSRElementRenderingInfo
      { attributeIndicesThatAreNeededDuringHydration :: Set AttrIndex
      , ancestry :: Ancestry
      }
  | SerializableSSRTextRenderingInfo
      { ancestry :: Ancestry
      , isPure :: Boolean
      }

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
  { attributeIndicesThatAreNeededDuringHydration :: Set AttrIndex
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
              { attributeIndicesThatAreNeededDuringHydration: Set.empty
              , ancestry
              , backingElement
              }
          )
          ancestry
      )
      renderingInfo

markTextAsPure
  :: STRef.STRef Global SSRTextRenderingInfoCache
  -> STFn1 Ancestry Global Unit
markTextAsPure renderingInfo = mkSTFn1 \id -> do
  runSTFn3 updateRenderingInfo id f renderingInfo
  where
  f = over SSRTextRenderingInfo \r -> r
    { isPure = true
    }

markAttributeIndexForHydration
  :: STRef.STRef Global SSRElementRenderingInfoCache
  -> STFn2 Ancestry AttrIndex Global Unit
markAttributeIndexForHydration renderingInfo = mkSTFn2 \id ix -> do
  runSTFn3 updateRenderingInfo id
    ( over SSRElementRenderingInfo
        ( \i@{ attributeIndicesThatAreNeededDuringHydration } ->
            i
              { attributeIndicesThatAreNeededDuringHydration =
                  Set.insert
                    ix
                    attributeIndicesThatAreNeededDuringHydration
              }
        )
    )
    renderingInfo

type SSRTextRenderingInfoCache = Map.Map Ancestry SSRTextRenderingInfo

newtype SSRTextRenderingInfo = SSRTextRenderingInfo
  { ancestry :: Ancestry
  , isPure :: Boolean
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
              , isPure: false
              , backingText
              }
          )
          ancestry
      )
      renderingInfo

ssrDOMInterpret
  :: STRef.STRef Global SSRTextRenderingInfoCache
  -> STRef.STRef Global SSRElementRenderingInfoCache
  -> Core.DOMInterpret
ssrDOMInterpret textRenderingInfo elementRenderingInfo =
  Core.DOMInterpret
    { dynamicDOMInterpret: \_ -> noOpDomInterpret
    --
    , isBoring: const false
    , makeElement: I.makeElementEffect
    , attachElement: I.attachElementEffect
    , initializeElementRendering: initializeElementRendering
        elementRenderingInfo
    , markAttributeIndexForHydration: markAttributeIndexForHydration
        elementRenderingInfo
    , shouldSkipAttribute: \_ _ -> false
    , setProp: I.setPropEffect
    , setCb: I.setCbEffect
    , unsetAttribute: I.unsetAttributeEffect
    , removeElement: I.removeElementEffect
    --
    , makeText: I.makeTextEffect
    , attachText: I.attachTextEffect
    , setText: I.setTextEffect
    , removeText: I.removeTextEffect
    , initializeTextRendering: initializeTextRendering textRenderingInfo
    , markTextAsPure: markTextAsPure textRenderingInfo
    --
    , beamRegion: I.beamRegionEffect
    , bufferPortal: I.bufferPortal
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
    --
    , isBoring: const false
    , markAttributeIndexForHydration: mkSTFn2 \_ _ -> pure unit
    , shouldSkipAttribute: \_ _ -> false
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
    , markTextAsPure: mkSTFn1 \_ -> pure unit
    --
    , beamRegion: mkEffectFn3 \_ _ _ -> pure unit
    , bufferPortal: I.bufferPortal
    }