module Deku.DOM.Elt.Time where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Time_

time
  :: Array (Event (Attribute Time_))
  -> Array Nut
  -> Nut
time = DC.elementify2 "time"

time_
  :: Array Nut
  -> Nut
time_ = time empty

time__
  :: String
  -> Nut
time__ t = time_ [ DC.text_ t ]
