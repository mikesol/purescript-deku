module Deku.DOM.Elt.Img where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Img_

img :: Array (FRP.Event.Event (Deku.Attribute.Attribute Img_)) -> Array Nut -> Nut
img = DC.elementify2 "img"

img_ :: Array Nut -> Nut
img_ = img empty

img__ :: String -> Nut
img__ t = img_ [ DC.text_ t ]
