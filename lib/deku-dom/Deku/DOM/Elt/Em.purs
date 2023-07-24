module Deku.DOM.Elt.Em where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Em_

em :: Array (FRP.Event.Event (Deku.Attribute.Attribute Em_)) -> Array Nut -> Nut
em = DC.elementify2 "em"

em_ :: Array Nut -> Nut
em_ = em empty

em__ :: String -> Nut
em__ t = em_ [ DC.text_ t ]
