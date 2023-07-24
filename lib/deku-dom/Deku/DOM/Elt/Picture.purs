module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Picture_

picture :: Array (FRP.Event.Event (Deku.Attribute.Attribute Picture_)) -> Array Nut -> Nut
picture = DC.elementify2 "picture"

picture_ :: Array Nut -> Nut
picture_ = picture empty

picture__ :: String -> Nut
picture__ t = picture_ [ DC.text_ t ]
