module Deku.DOM.Elt.FeColorMatrix where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data FeColorMatrix_

feColorMatrix
  :: Array (Event (Attribute FeColorMatrix_))
  -> Array Nut
  -> Nut
feColorMatrix = DC.elementify2 "feColorMatrix"

feColorMatrix_
  :: Array Nut
  -> Nut
feColorMatrix_ = feColorMatrix empty

feColorMatrix__
  :: String
  -> Nut
feColorMatrix__ t = feColorMatrix_ [ DC.text_ t ]
