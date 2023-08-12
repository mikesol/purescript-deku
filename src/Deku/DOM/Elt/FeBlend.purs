module Deku.DOM.Elt.FeBlend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data FeBlend_

feBlend
  :: Array (Poll (Attribute FeBlend_))
  -> Array Nut
  -> Nut
feBlend = DC.elementify2 "feBlend"

feBlend_
  :: Array Nut
  -> Nut
feBlend_ = feBlend empty

feBlend__
  :: String
  -> Nut
feBlend__ t = feBlend_ [ DC.text t ]
