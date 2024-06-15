module Deku.SSR where

import Prelude

import Data.Maybe (Maybe(..), isJust)
import Deku.Core (PSR(..))
import FRP.Poll (Poll(..))

pollIsImmediate :: forall a. Poll a -> Boolean
pollIsImmediate (OnlyPure _) = true
pollIsImmediate _ = false

psrIsImmediate :: PSR -> Boolean
psrIsImmediate (PSR p) = isJust do
  b <- p.beacon
  l <- b.lifecycle
  case l of
    OnlyPure _ -> pure unit
    _ -> Nothing