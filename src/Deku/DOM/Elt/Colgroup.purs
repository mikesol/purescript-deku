module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

colgroup
  :: Array (Attribute Tags.Colgroup_)
  -> Array Nut
  -> Nut
colgroup = DC.elementify3 "colgroup"

colgroup_
  :: Array Nut
  -> Nut
colgroup_ = colgroup empty

colgroup__
  :: String
  -> Nut
colgroup__ t = colgroup_ [ DC.text_ t ]
