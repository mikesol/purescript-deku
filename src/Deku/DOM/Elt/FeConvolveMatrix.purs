module Deku.DOM.Elt.FeConvolveMatrix where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeConvolveMatrix_

feConvolveMatrix
  :: Event (Attribute FeConvolveMatrix_)
  -> Array Domable
  -> Domable
feConvolveMatrix = DC.elementify2 "feConvolveMatrix"

feConvolveMatrix_
  :: Array Domable
  -> Domable
feConvolveMatrix_ = feConvolveMatrix empty

feConvolveMatrix__
  :: String
  -> Domable
feConvolveMatrix__ t = feConvolveMatrix_ [ DC.text_ t ]
