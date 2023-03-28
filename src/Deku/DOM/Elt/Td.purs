module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Td_

td
  :: Event (Attribute Td_)
  -> Array Domable
  -> Domable
td = DC.elementify2 "td"

td_
  :: Array Domable
  -> Domable
td_ = td empty

td__
  :: String
  -> Domable
td__ t = td_ [ DC.text_ t ]
