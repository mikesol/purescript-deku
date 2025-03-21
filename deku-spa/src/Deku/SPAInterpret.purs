module Deku.SPAInterpret where

import Prelude

import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2)
import Deku.Core as Core
import Deku.DOMInterpret as I

spaInterpret :: Core.DOMInterpret
spaInterpret = Core.DOMInterpret
  { dynamicDOMInterpret: \_ -> spaInterpret
  , portalDOMInterpret: \_ -> spaInterpret
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
  , initializePortalRendering: mkSTFn1 \_ -> pure unit
  , markPortalAsRendered: mkSTFn1 \_ -> pure unit
  , bufferPortal: I.bufferPortal
  --
  , initializeDynRendering: mkSTFn1 \_ -> pure unit
  , initializeFixedRendering: mkSTFn1 \_ -> pure unit
  , setInnerHTML: I.setInnerHtmlEffect
  }