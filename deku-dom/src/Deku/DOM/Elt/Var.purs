module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Var_

var :: Array (FRP.Event.Event (Deku.Attribute.Attribute Var_)) -> Array Nut -> Nut
var = DC.elementify2 "var"

var_ :: Array Nut -> Nut
var_ = var empty

var__ :: String -> Nut
var__ t = var_ [ DC.text_ t ]
