module Deku.DOM.Elt.RadialGradient where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data RadialGradient_

radialGradient
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute RadialGradient_)) -> Array Nut -> Nut
radialGradient = DC.elementify2 "radialGradient"

radialGradient_ :: Array Nut -> Nut
radialGradient_ = radialGradient empty

radialGradient__ :: String -> Nut
radialGradient__ t = radialGradient_ [ DC.text_ t ]
