module Deku.Edgeable where

import Prelude
import Data.Tuple.Nested (type (/\), (/\))
import Prim.Row as Row
import Prim.Symbol as Sym
import Type.Proxy (Proxy(..))
import Deku.Util (class AutoIncrementingInsert)

class Edgeable a b | a -> b where
  withEdge :: a -> b

instance edgeableTuple :: Edgeable (a /\ b) (a /\ b) where
  withEdge = identity
else instance edgeableRest :: Edgeable a (a /\ {}) where
  withEdge = flip (/\) {}

class EdgeableT (a :: Type) (b :: Type) | a -> b

instance edgeableTTuple :: EdgeableT (a /\ b) (a /\ b)
else instance edgeableTRest :: EdgeableT a (a /\ {})
