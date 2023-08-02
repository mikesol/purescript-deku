module Deku.DOM.Elt.Tfoot where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Tfoot_

tfoot
  :: Array (Attribute Tfoot_)
  -> Array Nut
  -> Nut
tfoot = DC.elementify2 "tfoot"

tfoot_
  :: Array Nut
  -> Nut
tfoot_ = tfoot empty

tfoot__
  :: String
  -> Nut
tfoot__ t = tfoot_ [ DC.text t ]
