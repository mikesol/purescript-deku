module Deku.DOM.Elt.FeSpecularLighting where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feSpecularLighting
  :: Array (Event (Attribute Tags.FeSpecularLighting_))
  -> Array Nut
  -> Nut
feSpecularLighting = DC.elementify3 "feSpecularLighting"

feSpecularLighting_
  :: Array Nut
  -> Nut
feSpecularLighting_ = feSpecularLighting empty

feSpecularLighting__
  :: String
  -> Nut
feSpecularLighting__ t = feSpecularLighting_ [ DC.text_ t ]
