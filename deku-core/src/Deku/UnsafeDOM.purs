module Deku.UnsafeDOM where

import Prelude

import Data.Nullable (Nullable)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4)
import Web.DOM (Element, Node, Text)
import Web.Event.Event (Event, EventType)
import Web.Event.EventTarget (EventListener, EventTarget)
import Web.HTML (HTMLTemplateElement)

foreign import unsafeParentNode :: EffectFn1 Node Node
foreign import unsafeFirstChildAsElement :: EffectFn1 Element Element

foreign import createElement :: EffectFn1 String Element
foreign import createElementNS :: EffectFn2 String String Element
foreign import createText :: EffectFn1 String Text

foreign import insertBefore :: EffectFn3 Node Node Node Unit
foreign import after :: EffectFn2 Node Node Unit
foreign import prepend :: EffectFn2 Node Node Unit


foreign import appendChild :: EffectFn2 Node Node Unit
foreign import toTemplate :: EffectFn1 String HTMLTemplateElement
foreign import cloneTemplate :: EffectFn1 HTMLTemplateElement Element
foreign import cloneElement :: EffectFn1 Element Element
foreign import outerHTML :: EffectFn1 Element String
foreign import setTextContent :: EffectFn2 String Node Unit

foreign import pushCb :: EffectFn3 String EventListener Element Unit
foreign import popCb :: EffectFn2 String Element ( Nullable EventListener )

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
