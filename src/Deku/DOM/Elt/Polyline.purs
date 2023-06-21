module Deku.DOM.Elt.Polyline where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

polyline
  :: Array (Event (Attribute Tags.Polyline_))
  -> Array Nut
  -> Nut
polyline = DC.elementify3 "polyline"

polyline_
  :: Array Nut
  -> Nut
polyline_ = polyline empty

polyline__
  :: String
  -> Nut
polyline__ t = polyline_ [ DC.text_ t ]
