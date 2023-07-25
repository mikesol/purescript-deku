module Deku.DOM.Elt.FeComposite where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeComposite_

feComposite :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeComposite_)) -> Array Nut -> Nut
feComposite = DC.elementify2 "feComposite"

feComposite_ :: Array Nut -> Nut
feComposite_ = feComposite empty

feComposite__ :: String -> Nut
feComposite__ t = feComposite_ [ DC.text_ t ]
