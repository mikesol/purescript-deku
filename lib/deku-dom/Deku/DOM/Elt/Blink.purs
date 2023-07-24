module Deku.DOM.Elt.Blink where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Blink_

blink :: Array (FRP.Event.Event (Deku.Attribute.Attribute Blink_)) -> Array Nut -> Nut
blink = DC.elementify2 "blink"

blink_ :: Array Nut -> Nut
blink_ = blink empty

blink__ :: String -> Nut
blink__ t = blink_ [ DC.text_ t ]
