module Deku.DOM.Elt.Filter where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Filter_

filter
  :: forall lock payload
   . Event (Attribute Filter_)
  -> Array (Domable lock payload)
  -> Domable lock payload
filter attributes kids = Domable
  ( Element'
      ( elementify "filter" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

filter_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
filter_ = filter empty
