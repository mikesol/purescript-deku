module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Xdata_

xdata
  :: Array (Poll (Attribute Xdata_))
  -> Array Nut
  -> Nut
xdata = DC.elementify2 "data"

xdata_
  :: Array Nut
  -> Nut
xdata_ = xdata empty

xdata__
  :: String
  -> Nut
xdata__ t = xdata_ [ DC.text t ]
