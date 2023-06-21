module Deku.DOM.Elt.Marker where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

marker
  :: Array (Attribute Tags.Marker_)
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
