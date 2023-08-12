module Deku.DOM.Elt.FeDiffuseLighting where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data FeDiffuseLighting_

feDiffuseLighting
  :: Array (Poll (Attribute FeDiffuseLighting_))
  -> Array Nut
  -> Nut
feDiffuseLighting = DC.elementify2 "feDiffuseLighting"

feDiffuseLighting_
  :: Array Nut
  -> Nut
feDiffuseLighting_ = feDiffuseLighting empty

feDiffuseLighting__
  :: String
  -> Nut
feDiffuseLighting__ t = feDiffuseLighting_ [ DC.text t ]
