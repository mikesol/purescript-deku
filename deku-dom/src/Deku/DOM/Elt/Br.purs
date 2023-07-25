module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Br_

br :: Array (FRP.Event.Event (Deku.Attribute.Attribute Br_)) -> Array Nut -> Nut
br = DC.elementify2 "br"

br_ :: Array Nut -> Nut
br_ = br empty

br__ :: String -> Nut
br__ t = br_ [ DC.text_ t ]
