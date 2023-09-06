module Deku.FullDOMInterpret where


import Deku.Core as Core
import Deku.Interpret as I

fullDOMInterpret :: Core.DOMInterpret
fullDOMInterpret = Core.DOMInterpret
  { makeElement: I.makeElementEffect
  , setProp: I.setPropEffect
  , setCb: I.setCbEffect
  , unsetAttribute: I.unsetAttributeEffect
  , attributeElementParent: I.attributeElementParentEffect
  , attributeDynParentForElement: I.attributeDynParentForElementEffect
  , sendToPosForElement: I.sendToPosForElementEffect
  , removeForElement: I.removeForElementEffect
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
  }