module Deku.DOM.Elt.Rect where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Rect_

rect
  :: Array (Event (Attribute Rect_))
  -> Array Nut
  -> Nut
rect = DC.elementify2 "rect"

rect_
  :: Array Nut
  -> Nut
rect_ = rect empty

rect__
  :: String
  -> Nut
rect__ t = rect_ [ DC.text_ t ]
