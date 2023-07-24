module Deku.DOM.Elt.FeGaussianBlur where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeGaussianBlur_

feGaussianBlur
  :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeGaussianBlur_)) -> Array Nut -> Nut
feGaussianBlur = DC.elementify2 "feGaussianBlur"

feGaussianBlur_ :: Array Nut -> Nut
feGaussianBlur_ = feGaussianBlur empty

feGaussianBlur__ :: String -> Nut
feGaussianBlur__ t = feGaussianBlur_ [ DC.text_ t ]
