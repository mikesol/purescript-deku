module Deku.DOM.Elt.Basefont where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Basefont_

basefont :: Array (FRP.Event.Event (Deku.Attribute.Attribute Basefont_)) -> Array Nut -> Nut
basefont = DC.elementify2 "basefont"

basefont_ :: Array Nut -> Nut
basefont_ = basefont empty

basefont__ :: String -> Nut
basefont__ t = basefont_ [ DC.text_ t ]
