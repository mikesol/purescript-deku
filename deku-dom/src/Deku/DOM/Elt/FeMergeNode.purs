module Deku.DOM.Elt.FeMergeNode where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data FeMergeNode_

feMergeNode :: Array (FRP.Event.Event (Deku.Attribute.Attribute FeMergeNode_)) -> Array Nut -> Nut
feMergeNode = DC.elementify2 "feMergeNode"

feMergeNode_ :: Array Nut -> Nut
feMergeNode_ = feMergeNode empty

feMergeNode__ :: String -> Nut
feMergeNode__ t = feMergeNode_ [ DC.text_ t ]
