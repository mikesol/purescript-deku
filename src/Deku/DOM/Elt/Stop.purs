module Deku.DOM.Elt.Stop where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

stop
  :: Array (Event (Attribute Tags.Stop_))
  -> Array Nut
  -> Nut
stop = DC.elementify3 "stop"

stop_
  :: Array Nut
  -> Nut
stop_ = stop empty

stop__
  :: String
  -> Nut
stop__ t = stop_ [ DC.text_ t ]
