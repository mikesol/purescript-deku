module Deku.DOM.Elt.FeColorMatrix where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

feColorMatrix
  :: Array (Attribute Tags.FeColorMatrix_)
  -> Array Nut
  -> Nut
feColorMatrix = DC.elementify3 "feColorMatrix"

feColorMatrix_
  :: Array Nut
  -> Nut
feColorMatrix_ = feColorMatrix empty

feColorMatrix__
  :: String
  -> Nut
feColorMatrix__ t = feColorMatrix_ [ DC.text_ t ]
