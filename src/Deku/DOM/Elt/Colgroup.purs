module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Colgroup_

colgroup
  :: Array (Event (Attribute Colgroup_))
  -> Array Nut
  -> Nut
colgroup = DC.elementify2 "colgroup"

colgroup_
  :: Array Nut
  -> Nut
colgroup_ = colgroup empty

colgroup__
  :: String
  -> Nut
colgroup__ t = colgroup_ [ DC.text_ t ]
