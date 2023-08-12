module Deku.DOM.Elt.Tr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Tr_

tr
  :: Array (Poll (Attribute Tr_))
  -> Array Nut
  -> Nut
tr = DC.elementify2 "tr"

tr_
  :: Array Nut
  -> Nut
tr_ = tr empty

tr__
  :: String
  -> Nut
tr__ t = tr_ [ DC.text t ]
