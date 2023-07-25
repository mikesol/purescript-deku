module Deku.DOM.Elt.FeFuncA where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeFuncA_

feFuncA :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeFuncA_)) -> Array Nut -> Nut
feFuncA = DC.elementify2 "feFuncA"

feFuncA_ :: Array Nut -> Nut
feFuncA_ = feFuncA empty

feFuncA__ :: String -> Nut
feFuncA__ t = feFuncA_ [ DC.text_ t ]
