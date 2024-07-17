module Deku.FullDOMInterpret where

import Deku.Core as Core
import Deku.Interpret as I

fullDOMInterpret :: Core.DOMInterpret
fullDOMInterpret = Core.DOMInterpret
  { makeElement: I.makeElementEffect
  , attachElement: I.attachElementEffect
  , setProp: I.setPropEffect
  , setCb: I.setCbEffect
  , unsetAttribute: I.unsetAttributeEffect
  , removeElement: I.removeElementEffect
  --
  , makeText: I.makeTextEffect
  , attachText: I.attachTextEffect
  , setText: I.setTextEffect
  , removeText: I.removeTextEffect
  --
  , beamRegion: I.beamRegionEffect
  , bufferPortal: I.bufferPortal
  }