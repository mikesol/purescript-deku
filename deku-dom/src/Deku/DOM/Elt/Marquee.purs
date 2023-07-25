module Deku.DOM.Elt.Marquee where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Marquee_

marquee :: Array (FRP.Event.Event (Deku.Attribute.Attribute Marquee_)) -> Array Nut -> Nut
marquee = DC.elementify2 "marquee"

marquee_ :: Array Nut -> Nut
marquee_ = marquee empty

marquee__ :: String -> Nut
marquee__ t = marquee_ [ DC.text_ t ]
