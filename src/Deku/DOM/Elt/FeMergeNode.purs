module Deku.DOM.Elt.FeMergeNode where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeMergeNode_

feMergeNode
  :: Event (Attribute FeMergeNode_)
  -> Array Domable
  -> Domable
feMergeNode = DC.elementify2 "feMergeNode"

feMergeNode_
  :: Array Domable
  -> Domable
feMergeNode_ = feMergeNode empty

feMergeNode__
  :: String
  -> Domable
feMergeNode__ t = feMergeNode_ [ DC.text_ t ]
