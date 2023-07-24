module Deku.DOM.Elt.Isindex where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Isindex_

isindex :: Array (FRP.Event.Event (Deku.Attribute.Attribute Isindex_)) -> Array Nut -> Nut
isindex = DC.elementify2 "isindex"

isindex_ :: Array Nut -> Nut
isindex_ = isindex empty

isindex__ :: String -> Nut
isindex__ t = isindex_ [ DC.text_ t ]
