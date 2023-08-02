module Deku.DOM.Elt.Pattern where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Pattern_

pattern
  :: Array (Attribute Pattern_)
  -> Array Nut
  -> Nut
pattern = DC.elementify2 "pattern"

pattern_
  :: Array Nut
  -> Nut
pattern_ = pattern empty

pattern__
  :: String
  -> Nut
pattern__ t = pattern_ [ DC.text t ]
