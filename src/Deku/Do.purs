module Deku.Do
  ( bind
  , discard
  ) where

import Prelude hiding (bind, discard)

bind :: forall a r q. ((a -> r) -> q) -> (a -> r) -> q
bind f a = f a

-- we do not use any warnings for discard
discard :: forall a r q. ((a -> r) -> q) -> (a -> r) -> q
discard = bind
