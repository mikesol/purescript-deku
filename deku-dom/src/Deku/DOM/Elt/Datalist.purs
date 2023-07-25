module Deku.DOM.Elt.Datalist where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Datalist_

datalist :: Array (FRP.Event.Event (Deku.Attribute.Attribute Datalist_)) -> Array Nut -> Nut
datalist = DC.elementify2 "datalist"

datalist_ :: Array Nut -> Nut
datalist_ = datalist empty

datalist__ :: String -> Nut
datalist__ t = datalist_ [ DC.text_ t ]
