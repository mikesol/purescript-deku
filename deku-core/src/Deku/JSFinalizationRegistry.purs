module Deku.JSFinalizationRegistry where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn2)

foreign import oneOffFinalizationRegistry :: forall a. EffectFn2 a (Effect Unit) Unit