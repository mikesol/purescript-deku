module Deku.Always where

import Prelude

import Data.Monoid.Always (class Always, always)
import Effect (Effect)
import Heterogeneous.Mapping (class HMap, class Mapping, hmap)

data AlwaysEffect = AlwaysEffect

instance
  ( Always (m Unit) (Effect Unit)
  ) =>
  Mapping AlwaysEffect (i -> m Unit) (i -> Effect Unit) where
  mapping AlwaysEffect = map always

halways :: forall i o. HMap AlwaysEffect i o => i -> o
halways = hmap AlwaysEffect