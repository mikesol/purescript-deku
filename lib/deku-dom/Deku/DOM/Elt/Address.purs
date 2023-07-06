module Deku.DOM.Elt.Address where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Address_

address
  :: Array (Event (Attribute Address_))
  -> Array Nut
  -> Nut
address = DC.elementify2 "address"

address_
  :: Array Nut
  -> Nut
address_ = address empty

address__
  :: String
  -> Nut
address__ t = address_ [ DC.text_ t ]
