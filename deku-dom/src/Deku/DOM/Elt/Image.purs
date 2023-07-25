module Deku.DOM.Elt.Image where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Image_

image :: Array (FRP.Event.Event (Deku.Attribute.Attribute Image_)) -> Array Nut -> Nut
image = DC.elementify2 "image"

image_ :: Array Nut -> Nut
image_ = image empty

image__ :: String -> Nut
image__ t = image_ [ DC.text_ t ]
