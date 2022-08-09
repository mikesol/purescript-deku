module Performance.Test.State.Shared where

import Prelude

import Halogen as H

type Slot id = forall q. H.Slot q Void id

data Output = Done

stateUpdates = 50 :: Int
