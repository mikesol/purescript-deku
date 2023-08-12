module Deku.DOM.Elt.Rt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Rt_

rt
  :: Array (Event (Attribute Rt_))
  -> Array Nut
  -> Nut
rt = DC.elementify2 "rt"

rt_
  :: Array Nut
  -> Nut
rt_ = rt empty

rt__
  :: String
  -> Nut
rt__ t = rt_ [ DC.text_ t ]
