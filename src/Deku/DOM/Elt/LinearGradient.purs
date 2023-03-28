module Deku.DOM.Elt.LinearGradient where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data LinearGradient_

linearGradient
  :: Event (Attribute LinearGradient_)
  -> Array Domable
  -> Domable
linearGradient = DC.elementify2 "linearGradient"

linearGradient_
  :: Array Domable
  -> Domable
linearGradient_ = linearGradient empty

linearGradient__
  :: String
  -> Domable
linearGradient__ t = linearGradient_ [ DC.text_ t ]
