module Deku.DOM.Elt.Address where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Address_

address
  :: Event (Attribute Address_)
  -> Array Domable
  -> Domable
address = DC.elementify2 "address"

address_
  :: Array Domable
  -> Domable
address_ = address empty

address__
  :: String
  -> Domable
address__ t = address_ [ DC.text_ t ]
