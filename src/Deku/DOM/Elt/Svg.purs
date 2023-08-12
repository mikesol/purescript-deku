module Deku.DOM.Elt.Svg where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Svg_

svg
  :: Array (Poll (Attribute Svg_))
  -> Array Nut
  -> Nut
svg = DC.elementify2 "svg"

svg_
  :: Array Nut
  -> Nut
svg_ = svg empty

svg__
  :: String
  -> Nut
svg__ t = svg_ [ DC.text t ]
