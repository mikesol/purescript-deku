module Deku.DOM.Elt.Marker where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

marker
  :: Array (Event (Attribute Tags.Marker_))
  -> Array Nut
  -> Nut
marker = DC.elementify3 "marker"

marker_
  :: Array Nut
  -> Nut
marker_ = marker empty

marker__
  :: String
  -> Nut
marker__ t = marker_ [ DC.text_ t ]
