module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data P_

p :: Array (FRP.Event.Event (Deku.Attribute.Attribute P_)) -> Array Nut -> Nut
p = DC.elementify2 "p"

p_ :: Array Nut -> Nut
p_ = p empty

p__ :: String -> Nut
p__ t = p_ [ DC.text_ t ]
