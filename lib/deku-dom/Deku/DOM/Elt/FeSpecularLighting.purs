module Deku.DOM.Elt.FeSpecularLighting where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data FeSpecularLighting_

feSpecularLighting
  :: Array (Event (Attribute FeSpecularLighting_))
  -> Array Nut
  -> Nut
feSpecularLighting = DC.elementify2 "feSpecularLighting"

feSpecularLighting_
  :: Array Nut
  -> Nut
feSpecularLighting_ = feSpecularLighting empty

feSpecularLighting__
  :: String
  -> Nut
feSpecularLighting__ t = feSpecularLighting_ [ DC.text_ t ]
