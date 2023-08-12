module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Dir_

dir
  :: Array (Poll (Attribute Dir_))
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
