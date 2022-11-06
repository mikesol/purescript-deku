module Deku.DOM.Elt.Circle where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Circle_

circle
  :: forall lock payload
   . Event (Attribute Circle_)
  -> Array (Domable lock payload)
  -> Domable lock payload
circle attributes kids = Domable
  ( Element'
      ( elementify "circle" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

circle_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
circle_ = circle empty
