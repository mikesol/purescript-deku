module Deku.DOM.Elt.Slot where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Slot_

slot :: Array (FRP.Event.Event (Deku.Attribute.Attribute Slot_)) -> Array Nut -> Nut
slot = DC.elementify2 "slot"

slot_ :: Array Nut -> Nut
slot_ = slot empty

slot__ :: String -> Nut
slot__ t = slot_ [ DC.text_ t ]
