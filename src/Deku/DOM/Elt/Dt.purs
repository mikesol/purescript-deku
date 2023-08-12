module Deku.DOM.Elt.Dt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Dt_

dt
  :: Array (Poll (Attribute Dt_))
  -> Array Nut
  -> Nut
dt = DC.elementify2 "dt"

dt_
  :: Array Nut
  -> Nut
dt_ = dt empty

dt__
  :: String
  -> Nut
dt__ t = dt_ [ DC.text t ]
