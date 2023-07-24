module Deku.DOM.Elt.FePointLight where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FePointLight_

fePointLight
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute FePointLight_)) -> Array Nut -> Nut
fePointLight = DC.elementify2 "fePointLight"

fePointLight_ :: Array Nut -> Nut
fePointLight_ = fePointLight empty

fePointLight__ :: String -> Nut
fePointLight__ t = fePointLight_ [ DC.text_ t ]
