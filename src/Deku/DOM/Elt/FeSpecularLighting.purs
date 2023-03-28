module Deku.DOM.Elt.FeSpecularLighting where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeSpecularLighting_

feSpecularLighting
  :: Event (Attribute FeSpecularLighting_)
  -> Array Domable
  -> Domable
feSpecularLighting = DC.elementify2 "feSpecularLighting"

feSpecularLighting_
  :: Array Domable
  -> Domable
feSpecularLighting_ = feSpecularLighting empty

feSpecularLighting__
  :: String
  -> Domable
feSpecularLighting__ t = feSpecularLighting_ [ DC.text_ t ]
