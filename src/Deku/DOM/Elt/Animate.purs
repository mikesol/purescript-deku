module Deku.DOM.Elt.Animate where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Animate_

animate
  :: Array (Event (Attribute Animate_))
  -> Array Nut
  -> Nut
animate = DC.elementify2 "animate"

animate_
  :: Array Nut
  -> Nut
animate_ = animate empty

animate__
  :: String
  -> Nut
animate__ t = animate_ [ DC.text_ t ]
