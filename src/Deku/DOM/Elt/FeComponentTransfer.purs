module Deku.DOM.Elt.FeComponentTransfer where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data FeComponentTransfer_

feComponentTransfer
  :: Array (Attribute FeComponentTransfer_)
  -> Array Nut
  -> Nut
feComponentTransfer = DC.elementify2 "feComponentTransfer"

feComponentTransfer_
  :: Array Nut
  -> Nut
feComponentTransfer_ = feComponentTransfer empty

feComponentTransfer__
  :: String
  -> Nut
feComponentTransfer__ t = feComponentTransfer_ [ DC.text t ]
