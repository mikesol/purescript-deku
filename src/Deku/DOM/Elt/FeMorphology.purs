module Deku.DOM.Elt.FeMorphology where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data FeMorphology_

feMorphology
  :: Array (Poll (Attribute FeMorphology_))
  -> Array Nut
  -> Nut
feMorphology = DC.elementify2 "feMorphology"

feMorphology_
  :: Array Nut
  -> Nut
feMorphology_ = feMorphology empty

feMorphology__
  :: String
  -> Nut
feMorphology__ t = feMorphology_ [ DC.text t ]
