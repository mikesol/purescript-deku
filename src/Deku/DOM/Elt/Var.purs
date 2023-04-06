module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Var_

var
  :: Array (Event (Attribute Var_))
  -> Array Nut
  -> Nut
var = DC.elementify2 "var"

var_
  :: Array Nut
  -> Nut
var_ = var empty

var__
  :: String
  -> Nut
var__ t = var_ [ DC.text_ t ]
