module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Output_

output :: Array (FRP.Event.Event (Deku.Attribute.Attribute Output_)) -> Array Nut -> Nut
output = DC.elementify2 "output"

output_ :: Array Nut -> Nut
output_ = output empty

output__ :: String -> Nut
output__ t = output_ [ DC.text_ t ]
