module Deku.FullDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2, mkSTFn4)
import Deku.Core as Core
import Deku.Interpret as I

fullDOMInterpret :: ST.ST Global Int -> Core.DOMInterpret
fullDOMInterpret tagger = Core.DOMInterpret
  { tagger
  , dynamicDOMInterpret: \_ -> fullDOMInterpret tagger
  --
  , isBoring: const false
  , makeElement: I.makeElementEffect
  , attachElement: I.attachElementEffect
  , initializeElementRendering: mkSTFn4 \_ _ _ _ -> pure unit
  , initializeTextRendering: mkSTFn4 \_ _ _ _ -> pure unit
  , incrementElementCount: mkSTFn1 \_ -> pure unit
  , markIndexAsNeedingHydration: mkSTFn2 \_ _ -> pure unit
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
  , incrementPureTextCount: mkSTFn1 \_ -> pure unit
  --
  , beamRegion: I.beamRegionEffect
  , bufferPortal: I.bufferPortal
  }