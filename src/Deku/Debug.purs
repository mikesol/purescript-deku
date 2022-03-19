module Deku.Debug where

import Prelude

import Data.Symbol (class IsSymbol)
import Prim.TypeError (class Warn, Above, Quote, Text)
import Type.Proxy (Proxy)

-- | A class used to print the input and output types of any indexed monad.
class IxSpy
  :: forall k1 k2 k3. (k1 -> k2 -> k3 -> Type) -> k1 -> k2 -> k3 -> Constraint
class IxSpy m i o a where
  ixspy :: m i o a -> m i o a

instance ixspyI :: (Warn ((Text "ixspy") ^^ (Quote (m i o a)))) => IxSpy m i o a where
  ixspy = identity

-- | A class used to print the input and output types of any indexed monad.
class IxSpy2
  :: forall k1 k2 k3
   . Symbol
  -> (k1 -> k2 -> k3 -> Type)
  -> k1
  -> k2
  -> k3
  -> Constraint
class IsSymbol l <= IxSpy2 l m i o a where
  ixspy2 :: Proxy l -> m i o a -> m i o a

instance ixspy2I ::
  ( IsSymbol l
  , Warn ((Text "ixspy2") ^^ (Text l) ^^ (Quote (m i o a)))
  ) =>
  IxSpy2 l m i o a where
  ixspy2 px = identity

infixr 5 type Above as ^^
