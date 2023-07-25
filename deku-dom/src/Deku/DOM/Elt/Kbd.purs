module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Kbd_

kbd :: Array (FRP.Event.Event (Deku.Attribute.Attribute Kbd_)) -> Array Nut -> Nut
kbd = DC.elementify2 "kbd"

kbd_ :: Array Nut -> Nut
kbd_ = kbd empty

kbd__ :: String -> Nut
kbd__ t = kbd_ [ DC.text_ t ]
