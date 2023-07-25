module Deku.DOM.Elt.H6 where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data H6_

h6 :: Array (FRP.Event.Event (Deku.Attribute.Attribute H6_)) -> Array Nut -> Nut
h6 = DC.elementify2 "h6"

h6_ :: Array Nut -> Nut
h6_ = h6 empty

h6__ :: String -> Nut
h6__ t = h6_ [ DC.text_ t ]
