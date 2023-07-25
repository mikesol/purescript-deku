module Deku.DOM.Elt.Polygon where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Polygon_

polygon :: Array (FRP.Event.Event (Deku.Attribute.Attribute Polygon_)) -> Array Nut -> Nut
polygon = DC.elementify2 "polygon"

polygon_ :: Array Nut -> Nut
polygon_ = polygon empty

polygon__ :: String -> Nut
polygon__ t = polygon_ [ DC.text_ t ]
