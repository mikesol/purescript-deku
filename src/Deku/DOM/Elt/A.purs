module Deku.DOM.Elt.A where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data A_

a
  :: Array (Attribute A_)
  -> Array Nut
  -> Nut
a = DC.elementify2 "a"

a_
  :: Array Nut
  -> Nut
a_ = a empty

a__
  :: String
  -> Nut
a__ t = a_ [ DC.text t ]
