module Deku.DOM.Elt.Menuitem where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Menuitem_

menuitem :: Array (FRP.Event.Event (Deku.Attribute.Attribute Menuitem_)) -> Array Nut -> Nut
menuitem = DC.elementify2 "menuitem"

menuitem_ :: Array Nut -> Nut
menuitem_ = menuitem empty

menuitem__ :: String -> Nut
menuitem__ t = menuitem_ [ DC.text_ t ]
