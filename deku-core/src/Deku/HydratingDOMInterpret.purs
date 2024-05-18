module Deku.HydratingDOMInterpret where

import Prelude

import Deku.Core as Core
import Deku.FullDOMInterpret (fullDOMInterpret)
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn2, mkEffectFn3, mkEffectFn4, mkEffectFn5)

hydratingDOMInterpret :: Core.DOMInterpret
hydratingDOMInterpret = Core.DOMInterpret
  { makeElement: I.makeElementEffect --
  , setProp: mkEffectFn3 \_ _ _ -> pure unit
  , setCb: I.setCbEffect
  , unsetAttribute: mkEffectFn2 \_ _ -> pure unit
  , attributeElementParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForElement: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , sendToPosForElement: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , removeForElement: mkEffectFn2 \_ _ -> pure unit
  --
  , makeOpenBeacon: I.makeOpenBeaconEffect --
  , makeCloseBeacon: I.makeCloseBeaconEffect --
  , attributeBeaconParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForBeacons: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , attributeBeaconFullRangeParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForBeaconFullRange: mkEffectFn4 \_ _ _ _ -> pure unit
  , sendToPosForDyn: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , removeForDyn: mkEffectFn3 \_ _ _ -> pure unit
  --
  , makeText: I.makeTextEffect --
  , setText: mkEffectFn2 \_ _ -> pure unit
  , attributeTextParent: mkEffectFn2 \_ _ -> pure unit
  , attributeDynParentForText: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , sendToPosForText: mkEffectFn5 \_ _ _ _ _ -> pure unit
  , removeForText: mkEffectFn2 \_ _ -> pure unit
  --
  , makePursx: I.makePursxEffect --
  --
  , next: \_ -> fullDOMInterpret
  }