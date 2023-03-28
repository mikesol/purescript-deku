module Deku.DOM.Elt.Polygon where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Polygon_

polygon
  :: Event (Attribute Polygon_)
  -> Array Domable
  -> Domable
polygon = DC.elementify2 "polygon"

polygon_
  :: Array Domable
  -> Domable
polygon_ = polygon empty

polygon__
  :: String
  -> Domable
polygon__ t = polygon_ [ DC.text_ t ]
