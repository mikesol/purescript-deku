module Deku.DOM.Elt.FeConvolveMatrix where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeConvolveMatrix_

feConvolveMatrix
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeConvolveMatrix_)) -> Array Nut -> Nut
feConvolveMatrix = DC.elementify2 "feConvolveMatrix"

feConvolveMatrix_ :: Array Nut -> Nut
feConvolveMatrix_ = feConvolveMatrix empty

feConvolveMatrix__ :: String -> Nut
feConvolveMatrix__ t = feConvolveMatrix_ [ DC.text_ t ]
