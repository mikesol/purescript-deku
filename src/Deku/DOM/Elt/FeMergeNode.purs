module Deku.DOM.Elt.FeMergeNode where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data FeMergeNode_

feMergeNode
  :: Array (Event (Attribute FeMergeNode_))
  -> Array Nut
  -> Nut
feMergeNode = DC.elementify2 "feMergeNode"

feMergeNode_
  :: Array Nut
  -> Nut
feMergeNode_ = feMergeNode empty

feMergeNode__
  :: String
  -> Nut
feMergeNode__ t = feMergeNode_ [ DC.text_ t ]
