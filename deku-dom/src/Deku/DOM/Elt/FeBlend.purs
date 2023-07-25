module Deku.DOM.Elt.FeBlend where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeBlend_

feBlend :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeBlend_)) -> Array Nut -> Nut
feBlend = DC.elementify2 "feBlend"

feBlend_ :: Array Nut -> Nut
feBlend_ = feBlend empty

feBlend__ :: String -> Nut
feBlend__ t = feBlend_ [ DC.text_ t ]
