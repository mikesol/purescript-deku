module Deku.FullDOMInterpret where

import Prelude

import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2)
import Deku.Core as Core
import Deku.Interpret as I

fullDOMInterpret :: Core.DOMInterpret
fullDOMInterpret = Core.DOMInterpret
  {  dynamicDOMInterpret: \_ -> fullDOMInterpret
  --
  , isBoring: const false
  , makeElement: I.makeElementEffect
  , attachElement: I.attachElementEffect
  , initializeElementRendering: mkSTFn2 \_ _ -> pure unit
  , initializeTextRendering: mkSTFn2 \_ _ -> pure unit
  , markElementAsImpure: mkSTFn1 \_ -> pure unit
  , setProp: I.setPropEffect
  , setCb: I.setCbEffect
  , unsetAttribute: I.unsetAttributeEffect
  , removeElement: I.removeElementEffect
  --
  , makeText: I.makeTextEffect
  , attachText: I.attachTextEffect
  , setText: I.setTextEffect
  , removeText: I.removeTextEffect
  , markTextAsImpure: mkSTFn1 \_ -> pure unit
  --
  , beamRegion: I.beamRegionEffect
  , bufferPortal: I.bufferPortal
  }