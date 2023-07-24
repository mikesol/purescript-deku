module Deku.DOM.Elt.Rb where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Rb_

rb :: Array (FRP.Event.Event (Deku.Attribute.Attribute Rb_)) -> Array Nut -> Nut
rb = DC.elementify2 "rb"

rb_ :: Array Nut -> Nut
rb_ = rb empty

rb__ :: String -> Nut
rb__ t = rb_ [ DC.text_ t ]
