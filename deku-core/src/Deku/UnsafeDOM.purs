module Deku.UnsafeDOM where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4)
import Web.DOM (DocumentFragment, Element, Node)
import Web.Event.Event (Event, EventType)
import Web.Event.EventTarget (EventListener, EventTarget)
import Web.HTML (HTMLTemplateElement)

foreign import unsafeGetElementById :: EffectFn1 String Element
foreign import unsafeParentNode :: EffectFn1 Node Node
foreign import unsafeParentElement :: EffectFn1 Element Element
foreign import unsafeFirstChild :: EffectFn1 Node Node
foreign import createElement :: EffectFn1 String Element
foreign import createElementNS :: EffectFn2 String String Element
foreign import insertBefore :: EffectFn3 Node Node Node Unit
foreign import appendChild :: EffectFn2 Node Node Unit
foreign import toTemplate :: EffectFn1 String HTMLTemplateElement
foreign import cloneTemplate :: EffectFn1 HTMLTemplateElement Element
foreign import outerHTML :: EffectFn1 Element String
foreign import setTextContent :: EffectFn2 String Node Unit
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

foreign import insertAdjacentHTML :: EffectFn3 String String Element Unit

foreign import unsafeCreateDocumentFragment :: Effect DocumentFragment
