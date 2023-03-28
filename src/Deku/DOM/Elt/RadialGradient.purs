module Deku.DOM.Elt.RadialGradient where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data RadialGradient_

radialGradient
  :: Event (Attribute RadialGradient_)
  -> Array Domable
  -> Domable
radialGradient = DC.elementify2 "radialGradient"

radialGradient_
  :: Array Domable
  -> Domable
radialGradient_ = radialGradient empty

radialGradient__
  :: String
  -> Domable
radialGradient__ t = radialGradient_ [ DC.text_ t ]
