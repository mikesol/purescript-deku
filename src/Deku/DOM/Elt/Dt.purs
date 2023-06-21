module Deku.DOM.Elt.Dt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

dt
  :: Array (Event (Attribute Tags.Dt_))
  -> Array Nut
  -> Nut
dt = DC.elementify3 "dt"

dt_
  :: Array Nut
  -> Nut
dt_ = dt empty

dt__
  :: String
  -> Nut
dt__ t = dt_ [ DC.text_ t ]
