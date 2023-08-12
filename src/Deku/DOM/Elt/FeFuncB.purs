module Deku.DOM.Elt.FeFuncB where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data FeFuncB_

feFuncB
  :: Array (Poll (Attribute FeFuncB_))
  -> Array Nut
  -> Nut
feFuncB = DC.elementify2 "feFuncB"

feFuncB_
  :: Array Nut
  -> Nut
feFuncB_ = feFuncB empty

feFuncB__
  :: String
  -> Nut
feFuncB__ t = feFuncB_ [ DC.text t ]
