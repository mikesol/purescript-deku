module Deku.DOM.Elt.Xmp where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Xmp_

xmp :: Array (FRP.Event.Event (Deku.Attribute.Attribute Xmp_)) -> Array Nut -> Nut
xmp = DC.elementify2 "xmp"

xmp_ :: Array Nut -> Nut
xmp_ = xmp empty

xmp__ :: String -> Nut
xmp__ t = xmp_ [ DC.text_ t ]
