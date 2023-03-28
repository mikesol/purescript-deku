module Deku.DOM.Elt.Rect where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Rect_

rect
  :: Event (Attribute Rect_)
  -> Array Domable
  -> Domable
rect = DC.elementify2 "rect"

rect_
  :: Array Domable
  -> Domable
rect_ = rect empty

rect__
  :: String
  -> Domable
rect__ t = rect_ [ DC.text_ t ]
