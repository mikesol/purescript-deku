module Deku.DOM.Elt.Footer where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Footer_

footer :: Array (FRP.Event.Event (Deku.Attribute.Attribute Footer_)) -> Array Nut -> Nut
footer = DC.elementify2 "footer"

footer_ :: Array Nut -> Nut
footer_ = footer empty

footer__ :: String -> Nut
footer__ t = footer_ [ DC.text_ t ]
