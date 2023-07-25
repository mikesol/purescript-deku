module Deku.DOM.Elt.Set where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Set_

set :: Array (FRP.Event.Event (Deku.Attribute.Attribute Set_)) -> Array Nut -> Nut
set = DC.elementify2 "set"

set_ :: Array Nut -> Nut
set_ = set empty

set__ :: String -> Nut
set__ t = set_ [ DC.text_ t ]
