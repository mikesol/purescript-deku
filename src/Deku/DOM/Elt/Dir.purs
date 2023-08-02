module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Dir_

dir
  :: Array (Attribute Dir_)
  -> Array Nut
  -> Nut
dir = DC.elementify2 "dir"

dir_
  :: Array Nut
  -> Nut
dir_ = dir empty

dir__
  :: String
  -> Nut
dir__ t = dir_ [ DC.text t ]
