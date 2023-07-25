module Deku.DOM.Elt.Strike where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Strike_

strike :: Array (FRP.Event.Event (Deku.Attribute.Attribute Strike_)) -> Array Nut -> Nut
strike = DC.elementify2 "strike"

strike_ :: Array Nut -> Nut
strike_ = strike empty

strike__ :: String -> Nut
strike__ t = strike_ [ DC.text_ t ]
