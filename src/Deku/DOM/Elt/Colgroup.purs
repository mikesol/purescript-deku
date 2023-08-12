module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Colgroup_

colgroup
  :: Array (Poll (Attribute Colgroup_))
  -> Array Nut
  -> Nut
colgroup = DC.elementify2 "colgroup"

colgroup_
  :: Array Nut
  -> Nut
colgroup_ = colgroup empty

colgroup__
  :: String
  -> Nut
colgroup__ t = colgroup_ [ DC.text t ]
