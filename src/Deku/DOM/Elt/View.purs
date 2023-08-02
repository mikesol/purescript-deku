module Deku.DOM.Elt.View where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data View_

view
  :: Array (Attribute View_)
  -> Array Nut
  -> Nut
view = DC.elementify2 "view"

view_
  :: Array Nut
  -> Nut
view_ = view empty

view__
  :: String
  -> Nut
view__ t = view_ [ DC.text t ]
