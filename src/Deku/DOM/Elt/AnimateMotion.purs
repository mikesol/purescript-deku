module Deku.DOM.Elt.AnimateMotion where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data AnimateMotion_

animateMotion
  :: Array (Poll (Attribute AnimateMotion_))
  -> Array Nut
  -> Nut
animateMotion = DC.elementify2 "animateMotion"

animateMotion_
  :: Array Nut
  -> Nut
animateMotion_ = animateMotion empty

animateMotion__
  :: String
  -> Nut
animateMotion__ t = animateMotion_ [ DC.text t ]
