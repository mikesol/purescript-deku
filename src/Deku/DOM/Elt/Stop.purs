module Deku.DOM.Elt.Stop where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Stop_

stop
  :: forall lock payload
   . Event (Attribute Stop_)
  -> Array (Domable lock payload)
  -> Domable lock payload
stop attributes kids = Domable
  ( Element'
      ( elementify "stop" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

stop_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
stop_ = stop empty
