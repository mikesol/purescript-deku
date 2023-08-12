module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Big_

big
  :: Array (Poll (Attribute Big_))
  -> Array Nut
  -> Nut
big = DC.elementify2 "big"

big_
  :: Array Nut
  -> Nut
big_ = big empty

big__
  :: String
  -> Nut
big__ t = big_ [ DC.text t ]
