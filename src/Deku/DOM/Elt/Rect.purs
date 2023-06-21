module Deku.DOM.Elt.Rect where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

rect
  :: Array (Attribute Tags.Rect_)
  -> Array Nut
  -> Nut
rect = DC.elementify3 "rect"

rect_
  :: Array Nut
  -> Nut
rect_ = rect empty

rect__
  :: String
  -> Nut
rect__ t = rect_ [ DC.text_ t ]
