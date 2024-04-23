module Deku.JSWeakRef where

import Data.Nullable (Nullable)
import Effect.Uncurried (EffectFn1)

data WeakRef :: Type -> Type
data WeakRef a

foreign import weakRef :: forall a. EffectFn1 a (WeakRef a)
foreign import deref :: forall a. EffectFn1 (WeakRef a) (Nullable a)