module Deku.DOM.Elt.Stop where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Stop_

stop
  :: Array (Event (Attribute Stop_))
  -> Array Nut
  -> Nut
stop = DC.elementify2 "stop"

stop_
  :: Array Nut
  -> Nut
stop_ = stop empty

stop__
  :: String
  -> Nut
stop__ t = stop_ [ DC.text_ t ]
