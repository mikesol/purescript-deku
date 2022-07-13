module Deku.STObject where

import Control.Monad.ST (ST)
import Foreign.Object (Object)
import Foreign.Object.ST as STO

foreign import freezeObj :: forall r a. STO.STObject r a -> ST r (Object a)
