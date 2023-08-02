module Deku.DOM.Elt.Noscript where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Noscript_

noscript
  :: Array (Attribute Noscript_)
  -> Array Nut
  -> Nut
noscript = DC.elementify2 "noscript"

noscript_
  :: Array Nut
  -> Nut
noscript_ = noscript empty

noscript__
  :: String
  -> Nut
noscript__ t = noscript_ [ DC.text t ]
