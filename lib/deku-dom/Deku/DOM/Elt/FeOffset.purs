module Deku.DOM.Elt.FeOffset where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeOffset_

feOffset :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeOffset_)) -> Array Nut -> Nut
feOffset = DC.elementify2 "feOffset"

feOffset_ :: Array Nut -> Nut
feOffset_ = feOffset empty

feOffset__ :: String -> Nut
feOffset__ t = feOffset_ [ DC.text_ t ]
