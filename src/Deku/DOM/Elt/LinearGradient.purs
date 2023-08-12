module Deku.DOM.Elt.LinearGradient where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data LinearGradient_

linearGradient
  :: Array (Event (Attribute LinearGradient_))
  -> Array Nut
  -> Nut
linearGradient = DC.elementify2 "linearGradient"

linearGradient_
  :: Array Nut
  -> Nut
linearGradient_ = linearGradient empty

linearGradient__
  :: String
  -> Nut
linearGradient__ t = linearGradient_ [ DC.text_ t ]
