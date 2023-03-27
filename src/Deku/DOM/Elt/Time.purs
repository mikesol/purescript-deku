module Deku.DOM.Elt.Time where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Time_

time
  :: Event (Attribute Time_)
  -> Array Domable
  -> Domable
time attributes kids = Domable
  ( Element'
      ( DC.elementify "time" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

time_
  :: Array Domable
  -> Domable
time_ = time empty

time__
  :: String
  -> Domable
time__ t = time_ [ DC.text_ t ]
