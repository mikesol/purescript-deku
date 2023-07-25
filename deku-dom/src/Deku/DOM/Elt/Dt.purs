module Deku.DOM.Elt.Dt where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Dt_

dt :: Array (FRP.Event.Event (Deku.Attribute.Attribute Dt_)) -> Array Nut -> Nut
dt = DC.elementify2 "dt"

dt_ :: Array Nut -> Nut
dt_ = dt empty

dt__ :: String -> Nut
dt__ t = dt_ [ DC.text_ t ]
