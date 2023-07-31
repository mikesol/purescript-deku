module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Area_

area :: Array (FRP.Event.Event (Deku.Attribute.Attribute Area_)) -> Array Nut -> Nut
area = DC.elementify2 "area"

area_ :: Array Nut -> Nut
area_ = area empty

area__ :: String -> Nut
area__ t = area_ [ DC.text_ t ]