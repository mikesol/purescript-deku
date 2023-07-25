module Deku.DOM.Elt.Li where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Li_

li :: Array (FRP.Event.Event (Deku.Attribute.Attribute Li_)) -> Array Nut -> Nut
li = DC.elementify2 "li"

li_ :: Array Nut -> Nut
li_ = li empty

li__ :: String -> Nut
li__ t = li_ [ DC.text_ t ]
