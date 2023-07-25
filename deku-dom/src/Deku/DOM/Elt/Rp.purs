module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Rp_

rp :: Array (FRP.Event.Event (Deku.Attribute.Attribute Rp_)) -> Array Nut -> Nut
rp = DC.elementify2 "rp"

rp_ :: Array Nut -> Nut
rp_ = rp empty

rp__ :: String -> Nut
rp__ t = rp_ [ DC.text_ t ]
