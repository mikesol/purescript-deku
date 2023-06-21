module Deku.DOM.Elt.LinearGradient where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

linearGradient
  :: Array (Attribute Tags.LinearGradient_)
  -> Array Nut
  -> Nut
linearGradient = DC.elementify3 "linearGradient"

linearGradient_
  :: Array Nut
  -> Nut
linearGradient_ = linearGradient empty

linearGradient__
  :: String
  -> Nut
linearGradient__ t = linearGradient_ [ DC.text_ t ]
