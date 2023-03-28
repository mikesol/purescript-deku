module Deku.DOM.Elt.AnimateTransform where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data AnimateTransform_

animateTransform
  :: Event (Attribute AnimateTransform_)
  -> Array Domable
  -> Domable
animateTransform = DC.elementify2 "animateTransform"

animateTransform_
  :: Array Domable
  -> Domable
animateTransform_ = animateTransform empty

animateTransform__
  :: String
  -> Domable
animateTransform__ t = animateTransform_ [ DC.text_ t ]
