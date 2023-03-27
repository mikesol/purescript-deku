module Deku.DOM.Elt.Track where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Track_

track
  :: Event (Attribute Track_)
  -> Array Domable
  -> Domable
track attributes kids = Domable
  ( Element'
      ( DC.elementify "track" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

track_
  :: Array Domable
  -> Domable
track_ = track empty

track__
  :: String
  -> Domable
track__ t = track_ [ DC.text_ t ]
