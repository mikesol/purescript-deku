module Deku.DOM.Elt.Text where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Text_

text :: Array (FRP.Event.Event (Deku.Attribute.Attribute Text_)) -> Array Nut -> Nut
text = DC.elementify2 "text"

text_ :: Array Nut -> Nut
text_ = text empty

text__ :: String -> Nut
text__ t = text_ [ DC.text_ t ]
