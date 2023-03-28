module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Track_

track
  :: Event (Attribute Track_)
  -> Array Domable
  -> Domable
track = DC.elementify2 "track"

track_
  :: Array Domable
  -> Domable
track_ = track empty

track__
  :: String
  -> Domable
track__ t = track_ [ DC.text_ t ]
