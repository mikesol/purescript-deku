module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Picture_

picture
  :: Array (Poll (Attribute Picture_))
  -> Array Nut
  -> Nut
picture = DC.elementify2 "picture"

picture_
  :: Array Nut
  -> Nut
picture_ = picture empty

picture__
  :: String
  -> Nut
picture__ t = picture_ [ DC.text t ]
