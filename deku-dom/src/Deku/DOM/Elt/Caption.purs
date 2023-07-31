module Deku.DOM.Elt.Caption where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Caption_

caption :: Array (FRP.Event.Event (Deku.Attribute.Attribute Caption_)) -> Array Nut -> Nut
caption = DC.elementify2 "caption"

caption_ :: Array Nut -> Nut
caption_ = caption empty

caption__ :: String -> Nut
caption__ t = caption_ [ DC.text_ t ]