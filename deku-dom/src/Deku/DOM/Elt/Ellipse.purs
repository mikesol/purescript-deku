module Deku.DOM.Elt.Ellipse where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Ellipse_

ellipse :: Array (FRP.Event.Event (Deku.Attribute.Attribute Ellipse_)) -> Array Nut -> Nut
ellipse = DC.elementify2 "ellipse"

ellipse_ :: Array Nut -> Nut
ellipse_ = ellipse empty

ellipse__ :: String -> Nut
ellipse__ t = ellipse_ [ DC.text_ t ]