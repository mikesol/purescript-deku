module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Summary_

summary :: Array (FRP.Event.Event (Deku.Attribute.Attribute Summary_)) -> Array Nut -> Nut
summary = DC.elementify2 "summary"

summary_ :: Array Nut -> Nut
summary_ = summary empty

summary__ :: String -> Nut
summary__ t = summary_ [ DC.text_ t ]
