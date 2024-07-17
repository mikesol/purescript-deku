-- maybe remove this module in favor of just using Web.DOM
module Deku.UnsafeDOM where

import Prelude

import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4)
import Web.DOM (Element, Node, Text)
import Web.Event.Event (Event, EventType)
import Web.Event.EventTarget (EventListener, EventTarget)

foreign import createElement :: EffectFn1 String Element
foreign import createElementNS :: EffectFn2 String String Element
foreign import createDocumentFragment :: Effect Element

foreign import createText :: EffectFn1 String Text
foreign import setTextContent :: EffectFn2 String Node Unit

foreign import pushCb :: EffectFn3 String EventListener Element Unit
foreign import popCb :: EffectFn2 String Element (Nullable EventListener)

foreign import after :: EffectFn2 (Array Node) Node Unit
foreign import prepend :: EffectFn2 (Array Node) Node Unit

foreign import addEventListener
  :: EffectFn4 EventType
       EventListener
       Boolean
       EventTarget
       Unit

-- | Removes a listener to an event target. The boolean argument indicates
-- | whether the listener should be removed for the "capture" phase.
foreign import removeEventListener
  :: EffectFn4 EventType
       EventListener
       Boolean
       EventTarget
       Unit

foreign import eventListener
  :: forall a
   . EffectFn1 (EffectFn1 Event a)
       EventListener
