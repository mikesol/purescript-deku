module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Section_

section :: Array (FRP.Event.Event (Deku.Attribute.Attribute Section_)) -> Array Nut -> Nut
section = DC.elementify2 "section"

section_ :: Array Nut -> Nut
section_ = section empty

section__ :: String -> Nut
section__ t = section_ [ DC.text_ t ]
