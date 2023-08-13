module Deku.DOM.Elt.Datalist where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Datalist_

datalist
  :: Array (Poll (Attribute Datalist_))
  -> Array Nut
  -> Nut
datalist = DC.elementify2 "datalist"

datalist_
  :: Array Nut
  -> Nut
datalist_ = datalist empty

datalist__
  :: String
  -> Nut
datalist__ t = datalist_ [ DC.text_ t ]
