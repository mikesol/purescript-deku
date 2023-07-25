module Deku.DOM.Elt.Rect where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Rect_

rect :: Array (FRP.Event.Event (Deku.Attribute.Attribute Rect_)) -> Array Nut -> Nut
rect = DC.elementify2 "rect"

rect_ :: Array Nut -> Nut
rect_ = rect empty

rect__ :: String -> Nut
rect__ t = rect_ [ DC.text_ t ]
