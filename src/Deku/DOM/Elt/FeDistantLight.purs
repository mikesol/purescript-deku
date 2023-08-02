module Deku.DOM.Elt.FeDistantLight where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data FeDistantLight_

feDistantLight
  :: Array (Attribute FeDistantLight_)
  -> Array Nut
  -> Nut
feDistantLight = DC.elementify2 "feDistantLight"

feDistantLight_
  :: Array Nut
  -> Nut
feDistantLight_ = feDistantLight empty

feDistantLight__
  :: String
  -> Nut
feDistantLight__ t = feDistantLight_ [ DC.text t ]
