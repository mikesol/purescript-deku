module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Hr_

hr
  :: Array (Poll (Attribute Hr_))
  -> Array Nut
  -> Nut
hr = DC.elementify2 "hr"

hr_
  :: Array Nut
  -> Nut
hr_ = hr empty

hr__
  :: String
  -> Nut
hr__ t = hr_ [ DC.text_ t ]
