module Deku.DOM.Elt.Legend where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Legend_

legend :: Array (FRP.Event.Event (Deku.Attribute.Attribute Legend_)) -> Array Nut -> Nut
legend = DC.elementify2 "legend"

legend_ :: Array Nut -> Nut
legend_ = legend empty

legend__ :: String -> Nut
legend__ t = legend_ [ DC.text_ t ]
