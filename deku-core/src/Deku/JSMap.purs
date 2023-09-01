module Deku.JSMap where

import Prelude

import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3)

data JSMap :: Type -> Type -> Type
data JSMap a b

foreign import newImpl :: forall a b. Effect (JSMap a b)
foreign import insert :: forall a b. EffectFn3 a b (JSMap a b) Unit
foreign import remove :: forall a b. EffectFn2 a (JSMap a b) Unit
foreign import get :: forall a b. EffectFn2 a (JSMap a b) (Nullable b)