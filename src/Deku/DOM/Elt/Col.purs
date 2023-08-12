module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Col_

col
  :: Array (Poll (Attribute Col_))
  -> Array Nut
  -> Nut
col = DC.elementify2 "col"

col_
  :: Array Nut
  -> Nut
col_ = col empty

col__
  :: String
  -> Nut
col__ t = col_ [ DC.text t ]
