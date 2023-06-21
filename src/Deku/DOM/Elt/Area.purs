module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

area
  :: Array (Event (Attribute Tags.Area_))
  -> Array Nut
  -> Nut
area = DC.elementify3 "area"

area_
  :: Array Nut
  -> Nut
area_ = area empty

area__
  :: String
  -> Nut
area__ t = area_ [ DC.text_ t ]
