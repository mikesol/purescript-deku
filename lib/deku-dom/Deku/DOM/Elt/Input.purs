module Deku.DOM.Elt.Input where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Input_

input :: Array (FRP.Event.Event (Deku.Attribute.Attribute Input_)) -> Array Nut -> Nut
input = DC.elementify2 "input"

input_ :: Array Nut -> Nut
input_ = input empty

input__ :: String -> Nut
input__ t = input_ [ DC.text_ t ]
