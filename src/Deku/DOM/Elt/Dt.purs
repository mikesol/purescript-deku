module Deku.DOM.Elt.Dt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Dt_

dt
  :: Event (Attribute Dt_)
  -> Array Domable
  -> Domable
dt = DC.elementify2 "dt"

dt_
  :: Array Domable
  -> Domable
dt_ = dt empty

dt__
  :: String
  -> Domable
dt__ t = dt_ [ DC.text_ t ]
