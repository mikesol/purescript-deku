module Deku.DOM.Elt.Animate where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Animate_

animate
  :: Event (Attribute Animate_)
  -> Array Domable
  -> Domable
animate = DC.elementify2 "animate"

animate_
  :: Array Domable
  -> Domable
animate_ = animate empty

animate__
  :: String
  -> Domable
animate__ t = animate_ [ DC.text_ t ]
