module Deku.DOM.Elt.FeMerge where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeMerge_

feMerge :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeMerge_)) -> Array Nut -> Nut
feMerge = DC.elementify2 "feMerge"

feMerge_ :: Array Nut -> Nut
feMerge_ = feMerge empty

feMerge__ :: String -> Nut
feMerge__ t = feMerge_ [ DC.text_ t ]
