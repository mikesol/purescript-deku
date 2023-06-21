module Deku.DOM.Elt.FeGaussianBlur where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

feGaussianBlur
  :: Array (Attribute Tags.FeGaussianBlur_)
  -> Array Nut
  -> Nut
feGaussianBlur = DC.elementify3 "feGaussianBlur"

feGaussianBlur_
  :: Array Nut
  -> Nut
feGaussianBlur_ = feGaussianBlur empty

feGaussianBlur__
  :: String
  -> Nut
feGaussianBlur__ t = feGaussianBlur_ [ DC.text_ t ]
