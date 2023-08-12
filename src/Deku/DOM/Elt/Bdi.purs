module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Bdi_

bdi
  :: Array (Poll (Attribute Bdi_))
  -> Array Nut
  -> Nut
bdi = DC.elementify2 "bdi"

bdi_
  :: Array Nut
  -> Nut
bdi_ = bdi empty

bdi__
  :: String
  -> Nut
bdi__ t = bdi_ [ DC.text t ]
