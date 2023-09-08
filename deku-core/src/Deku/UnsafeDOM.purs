module Deku.UnsafeDOM where

import Prelude

import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4)
import Web.DOM (Element, Node)
import Web.Event.Event (EventType)
import Web.Event.EventTarget (EventListener, EventTarget)
import Web.HTML (HTMLTemplateElement)

foreign import unsafeParentNode :: EffectFn1 Node Node
foreign import createElement :: EffectFn1 String Element
foreign import createElementNS :: EffectFn2 String String Element
foreign import insertBefore :: EffectFn3 Node Node Node Unit
foreign import appendChild :: EffectFn2 Node Node Unit
foreign import toTemplate :: EffectFn1 String HTMLTemplateElement
foreign import getTemplateFirstChild :: EffectFn1 HTMLTemplateElement Element
foreign import cloneElement :: EffectFn1 Element Element
foreign import cloneTemplate :: EffectFn1 HTMLTemplateElement Element
foreign import outerHTML :: EffectFn1 Element String
foreign import addEventListener ::EffectFn4 EventType EventListener Boolean EventTarget Unit
foreign import removeEventListener :: EffectFn4 EventType EventListener Boolean EventTarget Unit