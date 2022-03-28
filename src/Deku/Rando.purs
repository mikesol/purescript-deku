module Deku.Rando where

import Prelude

import Effect.Random as R
import FRP.Behavior (Behavior, behavior)
import FRP.Event (makeEvent, subscribe)

random :: Behavior Number
random = behavior \f -> makeEvent \k -> do
  r <- R.random
  subscribe f \x -> k (x r)