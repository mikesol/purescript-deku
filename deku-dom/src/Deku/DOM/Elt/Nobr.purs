module Deku.DOM.Elt.Nobr where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Nobr_

nobr :: Array (FRP.Event.Event (Deku.Attribute.Attribute Nobr_)) -> Array Nut -> Nut
nobr = DC.elementify2 "nobr"

nobr_ :: Array Nut -> Nut
nobr_ = nobr empty

nobr__ :: String -> Nut
nobr__ t = nobr_ [ DC.text_ t ]
