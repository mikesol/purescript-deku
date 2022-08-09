module Deku.Do where

import Prelude hiding (bind, discard)

bind :: forall a r q. ((a -> r) -> q) -> (a -> r) -> q
bind f a = f a

discard :: forall r q. ((Unit -> r) -> q) -> (Unit -> r) -> q
discard = bind