module Deku.DOM.Elt.Menu where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Menu_

menu :: Array (FRP.Event.Event (Deku.Attribute.Attribute Menu_)) -> Array Nut -> Nut
menu = DC.elementify2 "menu"

menu_ :: Array Nut -> Nut
menu_ = menu empty

menu__ :: String -> Nut
menu__ t = menu_ [ DC.text_ t ]
