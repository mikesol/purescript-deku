module Deku.DOM.Elt.FeGaussianBlur where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data FeGaussianBlur_

feGaussianBlur
  :: Array (Attribute FeGaussianBlur_)
  -> Array Nut
  -> Nut
feGaussianBlur = DC.elementify2 "feGaussianBlur"

feGaussianBlur_
  :: Array Nut
  -> Nut
feGaussianBlur_ = feGaussianBlur empty

feGaussianBlur__
  :: String
  -> Nut
feGaussianBlur__ t = feGaussianBlur_ [ DC.text_ t ]
