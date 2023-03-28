module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Colgroup_

colgroup
  :: Event (Attribute Colgroup_)
  -> Array Domable
  -> Domable
colgroup = DC.elementify2 "colgroup"

colgroup_
  :: Array Domable
  -> Domable
colgroup_ = colgroup empty

colgroup__
  :: String
  -> Domable
colgroup__ t = colgroup_ [ DC.text_ t ]
