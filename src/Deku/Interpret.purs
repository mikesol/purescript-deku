module Deku.Interpret
  ( FFIDOMSnapshot
  , effectfulDOMInterpret
  , makeFFIDOMSnapshot
  , renderDOM
  ) where

import Prelude

import Deku.Core as Core
import Effect (Effect)
import Effect.Random as R
import FRP.Behavior (behavior)
import FRP.Event (makeEvent, subscribe)

-- foreign
data FFIDOMSnapshot

foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot

foreign import renderDOM :: Array (Effect Unit) -> Effect Unit

foreign import makeElement
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
foreign import setAttribute_
  :: Core.SetAttribute -> FFIDOMSnapshot -> Effect Unit

foreign import makePursx_
  :: Core.MakePursx
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makeNoop_ :: Core.MakeNoop -> FFIDOMSnapshot -> Effect Unit
foreign import giveNewParent_ :: Core.GiveNewParent -> FFIDOMSnapshot -> Effect Unit
foreign import disconnectElement_ :: Core.DisconnectElement -> FFIDOMSnapshot -> Effect Unit
foreign import sendToTop_ :: Core.SendToTop -> FFIDOMSnapshot -> Effect Unit
effectfulDOMInterpret :: Core.DOMInterpret (FFIDOMSnapshot -> Effect Unit)

effectfulDOMInterpret = Core.DOMInterpret
  { ids: map show $ behavior \f -> makeEvent \k -> do
      r <- R.random
      subscribe f \x -> k (x r)
  , makeElement: makeElement
  , makeRoot: makeRoot_
  , makeText: makeText_
  , makePursx: makePursx_
  , setAttribute: setAttribute_
  , setText: setText_
  , sendToTop: sendToTop_
  , makeNoop: makeNoop_
  , giveNewParent: giveNewParent_
  , disconnectElement: disconnectElement_
  }
