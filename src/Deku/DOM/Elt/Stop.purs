module Deku.DOM.Elt.Stop where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Stop_

stop
  :: Event (Attribute Stop_)
  -> Array Domable
  -> Domable
stop = DC.elementify2 "stop"

stop_
  :: Array Domable
  -> Domable
stop_ = stop empty

stop__
  :: String
  -> Domable
stop__ t = stop_ [ DC.text_ t ]
