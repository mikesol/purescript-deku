module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Bdi_

bdi :: Array (FRP.Event.Event (Deku.Attribute.Attribute Bdi_)) -> Array Nut -> Nut
bdi = DC.elementify2 "bdi"

bdi_ :: Array Nut -> Nut
bdi_ = bdi empty

bdi__ :: String -> Nut
bdi__ t = bdi_ [ DC.text_ t ]
