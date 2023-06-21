module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

td
  :: Array (Event (Attribute Tags.Td_))
  -> Array Nut
  -> Nut
td = DC.elementify3 "td"

td_
  :: Array Nut
  -> Nut
td_ = td empty

td__
  :: String
  -> Nut
td__ t = td_ [ DC.text_ t ]
