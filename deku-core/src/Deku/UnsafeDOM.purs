module Deku.UnsafeDOM where

import Prelude

import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3)
import Web.DOM (Element, Node)

foreign import unsafeParentNode :: EffectFn1 Node Node
foreign import createElement :: EffectFn1 String Element
foreign import createElementNS :: EffectFn2 String String Element
foreign import insertBefore :: EffectFn3 Node Node Node Unit
foreign import appendChild :: EffectFn2 Node Node Unit
