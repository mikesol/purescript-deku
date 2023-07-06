module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Optgroup_

optgroup
  :: Array (Event (Attribute Optgroup_))
  -> Array Nut
  -> Nut
optgroup = DC.elementify2 "optgroup"

optgroup_
  :: Array Nut
  -> Nut
optgroup_ = optgroup empty

optgroup__
  :: String
  -> Nut
optgroup__ t = optgroup_ [ DC.text_ t ]
