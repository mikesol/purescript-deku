module Deku.FullDOMInterpret where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2)
import Deku.Core as Core
import Deku.Interpret as I

fullDOMInterpret :: ST.ST Global Int -> Core.DOMInterpret
fullDOMInterpret tagger = Core.DOMInterpret
  { tagger
  , inStaticPart: true
  , disqualifyFromStaticRendering: mkSTFn1 mempty
  --
  , makeElement: I.makeElementEffect
  , attachElement: I.attachElementEffect
  , getUseableAttributes: mkSTFn2 \_ a -> pure a
  , incrementElementCount: mkSTFn1 mempty
  , setProp: I.setPropEffect
  , setCb: I.setCbEffect
  , unsetAttribute: I.unsetAttributeEffect
  , removeElement: I.removeElementEffect
  --
  , makeText: I.makeTextEffect
  , attachText: I.attachTextEffect
  , setText: I.setTextEffect
  , removeText: I.removeTextEffect
  , incrementPureTextCount: mkSTFn1 mempty
  --
  , beamRegion: I.beamRegionEffect
  , bufferPortal: I.bufferPortal
  }