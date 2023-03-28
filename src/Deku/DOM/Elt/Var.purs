module Deku.DOM.Elt.Var where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Var_

var
  :: Event (Attribute Var_)
  -> Array Domable
  -> Domable
var = DC.elementify2 "var"

var_
  :: Array Domable
  -> Domable
var_ = var empty

var__
  :: String
  -> Domable
var__ t = var_ [ DC.text_ t ]
