module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Td_

td
  :: Array (Event (Attribute Td_))
  -> Array Nut
  -> Nut
td = DC.elementify2 "td"

td_
  :: Array Nut
  -> Nut
td_ = td empty

td__
  :: String
  -> Nut
td__ t = td_ [ DC.text_ t ]
