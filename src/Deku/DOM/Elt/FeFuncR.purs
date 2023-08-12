module Deku.DOM.Elt.FeFuncR where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data FeFuncR_

feFuncR
  :: Array (Poll (Attribute FeFuncR_))
  -> Array Nut
  -> Nut
feFuncR = DC.elementify2 "feFuncR"

feFuncR_
  :: Array Nut
  -> Nut
feFuncR_ = feFuncR empty

feFuncR__
  :: String
  -> Nut
feFuncR__ t = feFuncR_ [ DC.text t ]
