module Deku.DOM.Elt.AnimateTransform where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

animateTransform
  :: Array (Attribute Tags.AnimateTransform_)
  -> Array Nut
  -> Nut
animateTransform = DC.elementify3 "animateTransform"

animateTransform_
  :: Array Nut
  -> Nut
animateTransform_ = animateTransform empty

animateTransform__
  :: String
  -> Nut
animateTransform__ t = animateTransform_ [ DC.text_ t ]
