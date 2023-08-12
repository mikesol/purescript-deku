module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Base_

base
  :: Array (Poll (Attribute Base_))
  -> Array Nut
  -> Nut
base = DC.elementify2 "base"

base_
  :: Array Nut
  -> Nut
base_ = base empty

base__
  :: String
  -> Nut
base__ t = base_ [ DC.text t ]
