module Deku.FullDOMInterpret where

import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Deku.Core as Core
import Deku.Interpret as I

fullDOMInterpret :: ST.ST Global Int -> Core.DOMInterpret
fullDOMInterpret tagger = Core.DOMInterpret
  { tagger
  , inStaticPart: true
  --
  , makeElement: I.makeElementEffect
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