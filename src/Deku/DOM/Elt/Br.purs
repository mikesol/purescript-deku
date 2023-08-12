module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Br_

br
  :: Array (Poll (Attribute Br_))
  -> Array Nut
  -> Nut
br = DC.elementify2 "br"

br_
  :: Array Nut
  -> Nut
br_ = br empty

br__
  :: String
  -> Nut
br__ t = br_ [ DC.text t ]
