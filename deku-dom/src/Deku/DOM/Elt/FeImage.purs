module Deku.DOM.Elt.FeImage where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeImage_

feImage :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeImage_)) -> Array Nut -> Nut
feImage = DC.elementify2 "feImage"

feImage_ :: Array Nut -> Nut
feImage_ = feImage empty

feImage__ :: String -> Nut
feImage__ t = feImage_ [ DC.text_ t ]
