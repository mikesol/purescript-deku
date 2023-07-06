module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Track_

track
  :: Array (Event (Attribute Track_))
  -> Array Nut
  -> Nut
track = DC.elementify2 "track"

track_
  :: Array Nut
  -> Nut
track_ = track empty

track__
  :: String
  -> Nut
track__ t = track_ [ DC.text_ t ]
