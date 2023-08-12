module Deku.DOM.Elt.H5 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data H5_

h5
  :: Array (Poll (Attribute H5_))
  -> Array Nut
  -> Nut
h5 = DC.elementify2 "h5"

h5_
  :: Array Nut
  -> Nut
h5_ = h5 empty

h5__
  :: String
  -> Nut
h5__ t = h5_ [ DC.text t ]
