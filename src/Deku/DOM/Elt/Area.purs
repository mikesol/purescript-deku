module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Area_

area
  :: Array (Attribute Area_)
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
area__ t = area_ [ DC.text t ]
