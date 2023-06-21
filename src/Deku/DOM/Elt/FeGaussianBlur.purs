module Deku.DOM.Elt.FeGaussianBlur where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feGaussianBlur
  :: Array (Event (Attribute Tags.FeGaussianBlur_))
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
