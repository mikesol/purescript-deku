module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Applet_

applet :: Array (FRP.Event.Event (Deku.Attribute.Attribute Applet_)) -> Array Nut -> Nut
applet = DC.elementify2 "applet"

applet_ :: Array Nut -> Nut
applet_ = applet empty

applet__ :: String -> Nut
applet__ t = applet_ [ DC.text_ t ]
