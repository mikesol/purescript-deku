module Deku.DOM.Elt.View where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data View_

view :: Array (FRP.Event.Event (Deku.Attribute.Attribute View_)) -> Array Nut -> Nut
view = DC.elementify2 "view"

view_ :: Array Nut -> Nut
view_ = view empty

view__ :: String -> Nut
view__ t = view_ [ DC.text_ t ]
