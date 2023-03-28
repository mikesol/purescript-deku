module Deku.DOM.Elt.FeColorMatrix where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeColorMatrix_

feColorMatrix
  :: Event (Attribute FeColorMatrix_)
  -> Array Domable
  -> Domable
feColorMatrix = DC.elementify2 "feColorMatrix"

feColorMatrix_
  :: Array Domable
  -> Domable
feColorMatrix_ = feColorMatrix empty

feColorMatrix__
  :: String
  -> Domable
feColorMatrix__ t = feColorMatrix_ [ DC.text_ t ]
