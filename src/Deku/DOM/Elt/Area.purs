module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Area_

area
  :: Array (Poll (Attribute Area_))
  -> Array Nut
  -> Nut
area = DC.elementify2 "area"

area_
  :: Array Nut
  -> Nut
area_ = area empty

area__
  :: String
  -> Nut
area__ t = area_ [ DC.text_ t ]
