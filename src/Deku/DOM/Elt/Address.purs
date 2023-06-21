module Deku.DOM.Elt.Address where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

address
  :: Array (Event (Attribute Tags.Address_))
  -> Array Nut
  -> Nut
address = DC.elementify3 "address"

address_
  :: Array Nut
  -> Nut
address_ = address empty

address__
  :: String
  -> Nut
address__ t = address_ [ DC.text_ t ]
