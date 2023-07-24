module Deku.DOM.Elt.G where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data G_

g :: Array (FRP.Event.Event (Deku.Attribute.Attribute G_)) -> Array Nut -> Nut
g = DC.elementify2 "g"

g_ :: Array Nut -> Nut
g_ = g empty

g__ :: String -> Nut
g__ t = g_ [ DC.text_ t ]
