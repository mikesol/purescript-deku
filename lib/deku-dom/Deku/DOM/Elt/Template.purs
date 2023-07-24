module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Template_

template :: Array (FRP.Event.Event (Deku.Attribute.Attribute Template_)) -> Array Nut -> Nut
template = DC.elementify2 "template"

template_ :: Array Nut -> Nut
template_ = template empty

template__ :: String -> Nut
template__ t = template_ [ DC.text_ t ]
