module Deku.DOM.Elt.Animate where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Animate_

animate
  :: forall lock payload
   . Event (Attribute Animate_)
  -> Array (Domable lock payload)
  -> Domable lock payload
animate attributes kids = Domable
  ( Element'
      ( elementify "animate" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

animate_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
animate_ = animate empty
