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
  , staticDOMInterpret: \_ -> fullDOMInterpret tagger
  , dynamicDOMInterpret: \_ -> fullDOMInterpret tagger
  , disqualifyFromStaticRendering: mkSTFn1 \_ -> pure unit
  --
  , isBoring: mkSTFn1 \_ -> pure false
  , registerParentChildRelationship: mkSTFn2 \_ _ -> pure unit
  , makeElement: I.makeElementEffect
  , attachElement: I.attachElementEffect
  , getUseableAttributes: mkSTFn2 \_ a -> pure a
  , incrementElementCount: mkSTFn1 \_ -> pure unit
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