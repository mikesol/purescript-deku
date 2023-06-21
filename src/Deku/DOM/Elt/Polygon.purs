module Deku.DOM.Elt.Polygon where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

polygon
  :: Array (Attribute Tags.Polygon_)
  -> Array Nut
  -> Nut
polygon = DC.elementify3 "polygon"

polygon_
  :: Array Nut
  -> Nut
polygon_ = polygon empty

polygon__
  :: String
  -> Nut
polygon__ t = polygon_ [ DC.text_ t ]
