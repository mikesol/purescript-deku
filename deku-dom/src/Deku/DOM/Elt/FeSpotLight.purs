module Deku.DOM.Elt.FeSpotLight where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeSpotLight_

feSpotLight :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeSpotLight_)) -> Array Nut -> Nut
feSpotLight = DC.elementify2 "feSpotLight"

feSpotLight_ :: Array Nut -> Nut
feSpotLight_ = feSpotLight empty

feSpotLight__ :: String -> Nut
feSpotLight__ t = feSpotLight_ [ DC.text_ t ]
