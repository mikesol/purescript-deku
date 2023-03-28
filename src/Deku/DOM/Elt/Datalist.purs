module Deku.DOM.Elt.Datalist where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Datalist_

datalist
  :: Event (Attribute Datalist_)
  -> Array Domable
  -> Domable
datalist = DC.elementify2 "datalist"

datalist_
  :: Array Domable
  -> Domable
datalist_ = datalist empty

datalist__
  :: String
  -> Domable
datalist__ t = datalist_ [ DC.text_ t ]
