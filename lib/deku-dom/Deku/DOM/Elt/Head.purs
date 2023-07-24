module Deku.DOM.Elt.Head where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Head_

head :: Array (FRP.Event.Event (Deku.Attribute.Attribute Head_)) -> Array Nut -> Nut
head = DC.elementify2 "head"

head_ :: Array Nut -> Nut
head_ = head empty

head__ :: String -> Nut
head__ t = head_ [ DC.text_ t ]
