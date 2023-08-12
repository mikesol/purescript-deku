module Deku.DOM.Elt.ClipPath where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data ClipPath_

clipPath
  :: Array (Poll (Attribute ClipPath_))
  -> Array Nut
  -> Nut
clipPath = DC.elementify2 "clipPath"

clipPath_
  :: Array Nut
  -> Nut
clipPath_ = clipPath empty

clipPath__
  :: String
  -> Nut
clipPath__ t = clipPath_ [ DC.text t ]
