module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Td_

td :: Array (FRP.Event.Event (Deku.Attribute.Attribute Td_)) -> Array Nut -> Nut
td = DC.elementify2 "td"

td_ :: Array Nut -> Nut
td_ = td empty

td__ :: String -> Nut
td__ t = td_ [ DC.text_ t ]
