module Deku.DOM.Elt.Tr where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Tr_

tr :: Array (FRP.Event.Event (Deku.Attribute.Attribute Tr_)) -> Array Nut -> Nut
tr = DC.elementify2 "tr"

tr_ :: Array Nut -> Nut
tr_ = tr empty

tr__ :: String -> Nut
tr__ t = tr_ [ DC.text_ t ]
