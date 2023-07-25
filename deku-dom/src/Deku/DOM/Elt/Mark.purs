module Deku.DOM.Elt.Mark where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Mark_

mark :: Array (FRP.Event.Event (Deku.Attribute.Attribute Mark_)) -> Array Nut -> Nut
mark = DC.elementify2 "mark"

mark_ :: Array Nut -> Nut
mark_ = mark empty

mark__ :: String -> Nut
mark__ t = mark_ [ DC.text_ t ]
