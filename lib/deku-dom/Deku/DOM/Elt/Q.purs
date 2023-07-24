module Deku.DOM.Elt.Q where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Q_

q :: Array (FRP.Event.Event (Deku.Attribute.Attribute Q_)) -> Array Nut -> Nut
q = DC.elementify2 "q"

q_ :: Array Nut -> Nut
q_ = q empty

q__ :: String -> Nut
q__ t = q_ [ DC.text_ t ]
