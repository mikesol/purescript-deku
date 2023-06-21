module Deku.DOM.Elt.Ellipse where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

ellipse
  :: Array (Attribute Tags.Ellipse_)
  -> Array Nut
  -> Nut
ellipse = DC.elementify3 "ellipse"

ellipse_
  :: Array Nut
  -> Nut
ellipse_ = ellipse empty

ellipse__
  :: String
  -> Nut
ellipse__ t = ellipse_ [ DC.text_ t ]
