module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

optgroup
  :: Array (Attribute Tags.Optgroup_)
  -> Array Nut
  -> Nut
optgroup = DC.elementify3 "optgroup"

optgroup_
  :: Array Nut
  -> Nut
optgroup_ = optgroup empty

optgroup__
  :: String
  -> Nut
optgroup__ t = optgroup_ [ DC.text_ t ]
