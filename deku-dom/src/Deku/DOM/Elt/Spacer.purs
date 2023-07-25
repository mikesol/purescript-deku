module Deku.DOM.Elt.Spacer where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Spacer_

spacer :: Array (FRP.Event.Event (Deku.Attribute.Attribute Spacer_)) -> Array Nut -> Nut
spacer = DC.elementify2 "spacer"

spacer_ :: Array Nut -> Nut
spacer_ = spacer empty

spacer__ :: String -> Nut
spacer__ t = spacer_ [ DC.text_ t ]
