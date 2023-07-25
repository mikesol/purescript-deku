module Deku.DOM.Elt.FeColorMatrix where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeColorMatrix_

feColorMatrix
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeColorMatrix_)) -> Array Nut -> Nut
feColorMatrix = DC.elementify2 "feColorMatrix"

feColorMatrix_ :: Array Nut -> Nut
feColorMatrix_ = feColorMatrix empty

feColorMatrix__ :: String -> Nut
feColorMatrix__ t = feColorMatrix_ [ DC.text_ t ]
