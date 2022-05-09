module Deku.Interpret
  ( FFIDOMSnapshot
  , effectfulDOMInterpret
  , makeFFIDOMSnapshot
  ) where

import Prelude

import Deku.Core as Core
import Effect (Effect)
import Effect.Random as R

-- foreign
data FFIDOMSnapshot

foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot

foreign import makeElement_
  :: Core.MakeElement
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import makeRoot_
  :: Core.MakeRoot
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import makeText_
  :: Core.MakeText
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import setText_
  :: Core.SetText
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import setProp_
  :: Core.SetProp -> FFIDOMSnapshot -> Effect Unit

foreign import setCb_
  :: Core.SetCb -> FFIDOMSnapshot -> Effect Unit

foreign import makePursx_
  :: Core.MakePursx
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import deleteFromCache_ :: Core.DeleteFromCache -> FFIDOMSnapshot -> Effect Unit
foreign import makeNoop_ :: Core.MakeNoop -> FFIDOMSnapshot -> Effect Unit
foreign import giveNewParent_ :: Core.GiveNewParent -> FFIDOMSnapshot -> Effect Unit
foreign import disconnectElement_ :: Core.DisconnectElement -> FFIDOMSnapshot -> Effect Unit
foreign import sendToTop_ :: Core.SendToTop -> FFIDOMSnapshot -> Effect Unit
effectfulDOMInterpret :: Core.DOMInterpret Effect (FFIDOMSnapshot -> Effect Unit)

effectfulDOMInterpret = Core.DOMInterpret
  { ids: map show R.random
  , makeElement: makeElement_
  , makeRoot: makeRoot_
  , makeText: makeText_
  , makePursx: makePursx_
  , setProp: setProp_
  , setCb: setCb_
  , setText: setText_
  , sendToTop: sendToTop_
  , makeNoop: makeNoop_
  , deleteFromCache: deleteFromCache_
  , giveNewParent: giveNewParent_
  , disconnectElement: disconnectElement_
  }
