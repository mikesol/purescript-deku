module Deku.JSMap where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3)
import Untagged.Union (UndefinedOr)

data JSMap (a :: Type) (b :: Type)

foreign import newImpl :: forall a b. Effect (JSMap a b)
foreign import getImpl :: forall a b. EffectFn2 a (JSMap a b) (UndefinedOr b)
foreign import setImpl :: forall a b. EffectFn3 a b (JSMap a b) Unit
