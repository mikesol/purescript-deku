module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Details_

details :: Array (FRP.Event.Event (Deku.Attribute.Attribute Details_)) -> Array Nut -> Nut
details = DC.elementify2 "details"

details_ :: Array Nut -> Nut
details_ = details empty

details__ :: String -> Nut
details__ t = details_ [ DC.text_ t ]
