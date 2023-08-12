module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Wbr_

wbr
  :: Array (Poll (Attribute Wbr_))
  -> Array Nut
  -> Nut
wbr = DC.elementify2 "wbr"

wbr_
  :: Array Nut
  -> Nut
wbr_ = wbr empty

wbr__
  :: String
  -> Nut
wbr__ t = wbr_ [ DC.text t ]
