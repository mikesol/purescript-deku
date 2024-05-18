module Deku.HydratingDOMInterpret where

import Prelude

import Deku.Core as Core
import Deku.Interpret as I
import Effect.Uncurried (mkEffectFn2, mkEffectFn3, mkEffectFn5)

fullDOMInterpret :: Core.DOMInterpret
fullDOMInterpret =
  let
    next = Core.DOMInterpret
      { makeElement: I.makeElementEffect --
      , setProp: mkEffectFn3 \_ _ _ -> pure unit
      , setCb: I.setCbEffect
      , unsetAttribute: mkEffectFn2 \_ _ -> pure unit
      , attributeElementParent: mkEffectFn2 \_ _ -> pure unit
      , attributeDynParentForElement: mkEffectFn5 \_ _ _ _ _ -> pure unit
      , sendToPosForElement: mkEffectFn5 \_ _ _ _ _ -> pure unit
      , removeForElement: mkEffectFn2 \_ _ -> pure unit
      --
      , makeOpenBeacon: I.makeOpenBeaconEffect
      , makeCloseBeacon: I.makeCloseBeaconEffect
      , attributeBeaconParent: I.attributeBeaconParentEffect
      , attributeDynParentForBeacons: I.attributeDynParentForBeaconsEffect
      , attributeBeaconFullRangeParent: I.attributeBeaconFullRangeParentEffect
      , attributeDynParentForBeaconFullRange:
          I.attributeDynParentForBeaconFullRangeEffect
      , sendToPosForDyn: I.sendToPosForDynEffect
      , removeForDyn: I.removeForDynEffect
      --
      , makeText: I.makeTextEffect
      , setText: I.setTextEffect
      , attributeTextParent: I.attributeTextParentEffect
      , attributeDynParentForText: I.attributeDynParentForTextEffect
      , sendToPosForText: I.sendToPosForTextEffect
      , removeForText: I.removeForTextEffect
      --
      , makePursx: I.makePursxEffect
      --
      , next: \_ -> next
      }
  in
    next