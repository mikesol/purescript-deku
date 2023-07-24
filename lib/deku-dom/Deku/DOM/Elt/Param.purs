module Deku.DOM.Elt.Param where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Param_

param :: Array (FRP.Event.Event (Deku.Attribute.Attribute Param_)) -> Array Nut -> Nut
param = DC.elementify2 "param"

param_ :: Array Nut -> Nut
param_ = param empty

param__ :: String -> Nut
param__ t = param_ [ DC.text_ t ]
