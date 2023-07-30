module Deku.DOM.Elt.FeImage where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data FeImage_

feImage
  :: Array (Attribute FeImage_)
  -> Array Nut
  -> Nut
feImage = DC.elementify2 "feImage"

feImage_
  :: Array Nut
  -> Nut
feImage_ = feImage empty

feImage__
  :: String
  -> Nut
feImage__ t = feImage_ [ DC.text_ t ]
