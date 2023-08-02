module Deku.DOM.Elt.H2 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data H2_

h2
  :: Array (Attribute H2_)
  -> Array Nut
  -> Nut
h2 = DC.elementify2 "h2"

h2_
  :: Array Nut
  -> Nut
h2_ = h2 empty

h2__
  :: String
  -> Nut
h2__ t = h2_ [ DC.text t ]
