module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Optgroup_

optgroup
  :: Event (Attribute Optgroup_)
  -> Array Domable
  -> Domable
optgroup = DC.elementify2 "optgroup"

optgroup_
  :: Array Domable
  -> Domable
optgroup_ = optgroup empty

optgroup__
  :: String
  -> Domable
optgroup__ t = optgroup_ [ DC.text_ t ]
