module Deku.DOM.Elt.FeSpecularLighting where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeSpecularLighting_

feSpecularLighting
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeSpecularLighting_)) -> Array Nut -> Nut
feSpecularLighting = DC.elementify2 "feSpecularLighting"

feSpecularLighting_ :: Array Nut -> Nut
feSpecularLighting_ = feSpecularLighting empty

feSpecularLighting__ :: String -> Nut
feSpecularLighting__ t = feSpecularLighting_ [ DC.text_ t ]