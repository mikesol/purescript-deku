module Deku.DOM.Elt.Marker where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Marker_

marker
  :: Array (Event (Attribute Marker_))
  -> Array Nut
  -> Nut
marker = DC.elementify2 "marker"

marker_
  :: Array Nut
  -> Nut
marker_ = marker empty

marker__
  :: String
  -> Nut
marker__ t = marker_ [ DC.text_ t ]
