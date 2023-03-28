module Deku.DOM.Elt.AnimateMotion where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data AnimateMotion_

animateMotion
  :: Event (Attribute AnimateMotion_)
  -> Array Domable
  -> Domable
animateMotion = DC.elementify2 "animateMotion"

animateMotion_
  :: Array Domable
  -> Domable
animateMotion_ = animateMotion empty

animateMotion__
  :: String
  -> Domable
animateMotion__ t = animateMotion_ [ DC.text_ t ]
