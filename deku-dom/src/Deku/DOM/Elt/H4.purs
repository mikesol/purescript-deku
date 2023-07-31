module Deku.DOM.Elt.H4 where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data H4_

h4 :: Array (FRP.Event.Event (Deku.Attribute.Attribute H4_)) -> Array Nut -> Nut
h4 = DC.elementify2 "h4"

h4_ :: Array Nut -> Nut
h4_ = h4 empty

h4__ :: String -> Nut
h4__ t = h4_ [ DC.text_ t ]