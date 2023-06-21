module Deku.DOM.Elt.FeMergeNode where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feMergeNode
  :: Array (Event (Attribute Tags.FeMergeNode_))
  -> Array Nut
  -> Nut
feMergeNode = DC.elementify3 "feMergeNode"

feMergeNode_
  :: Array Nut
  -> Nut
feMergeNode_ = feMergeNode empty

feMergeNode__
  :: String
  -> Nut
feMergeNode__ t = feMergeNode_ [ DC.text_ t ]
