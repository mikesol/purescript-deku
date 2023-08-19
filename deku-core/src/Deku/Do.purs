-- | Rebindable `do` notation for Deku apps. See the [Deku readme](https://github.com/mikesol/purescript-deku/blob/main/README.md) and the [Deku guide](https://purescript-deku.netlify.app) for examples of where
-- | to use `Deku.Do`.
module Deku.Do
  ( bind
  , discard
  ) where

import Prelude hiding (bind, discard)

bind :: forall a r q. ((a -> r) -> q) -> (a -> r) -> q
bind f a = f a

-- we do not use any warnings for discard
discard :: forall r q. ((Unit -> r) -> q) -> (Unit -> r) -> q
discard = bind
