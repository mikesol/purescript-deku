module Deku.DOM.Elt.FeConvolveMatrix where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

feConvolveMatrix
  :: Array (Attribute Tags.FeConvolveMatrix_)
  -> Array Nut
  -> Nut
feConvolveMatrix = DC.elementify3 "feConvolveMatrix"

feConvolveMatrix_
  :: Array Nut
  -> Nut
feConvolveMatrix_ = feConvolveMatrix empty

feConvolveMatrix__
  :: String
  -> Nut
feConvolveMatrix__ t = feConvolveMatrix_ [ DC.text_ t ]
