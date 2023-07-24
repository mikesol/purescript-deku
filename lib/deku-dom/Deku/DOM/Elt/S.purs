module Deku.DOM.Elt.S where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data S_

s :: Array (FRP.Event.Event (Deku.Attribute.Attribute S_)) -> Array Nut -> Nut
s = DC.elementify2 "s"

s_ :: Array Nut -> Nut
s_ = s empty

s__ :: String -> Nut
s__ t = s_ [ DC.text_ t ]
