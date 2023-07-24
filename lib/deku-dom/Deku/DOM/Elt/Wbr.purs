module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Wbr_

wbr :: Array (FRP.Event.Event (Deku.Attribute.Attribute Wbr_)) -> Array Nut -> Nut
wbr = DC.elementify2 "wbr"

wbr_ :: Array Nut -> Nut
wbr_ = wbr empty

wbr__ :: String -> Nut
wbr__ t = wbr_ [ DC.text_ t ]
