module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Font_

font :: Array (FRP.Event.Event (Deku.Attribute.Attribute Font_)) -> Array Nut -> Nut
font = DC.elementify2 "font"

font_ :: Array Nut -> Nut
font_ = font empty

font__ :: String -> Nut
font__ t = font_ [ DC.text_ t ]
