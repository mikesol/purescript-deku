module Deku.DOM.Elt.Time where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Time_

time
  :: Event (Attribute Time_)
  -> Array Domable
  -> Domable
time = DC.elementify2 "time"

time_
  :: Array Domable
  -> Domable
time_ = time empty

time__
  :: String
  -> Domable
time__ t = time_ [ DC.text_ t ]
