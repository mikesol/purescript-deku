module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data H1_

h1 :: Array (FRP.Event.Event (Deku.Attribute.Attribute H1_)) -> Array Nut -> Nut
h1 = DC.elementify2 "h1"

h1_ :: Array Nut -> Nut
h1_ = h1 empty

h1__ :: String -> Nut
h1__ t = h1_ [ DC.text_ t ]
