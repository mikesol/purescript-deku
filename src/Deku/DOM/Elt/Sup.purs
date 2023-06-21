module Deku.DOM.Elt.Sup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

sup
  :: Array (Attribute Tags.Sup_)
  -> Array Nut
  -> Nut
sup = DC.elementify3 "sup"

sup_
  :: Array Nut
  -> Nut
sup_ = sup empty

sup__
  :: String
  -> Nut
sup__ t = sup_ [ DC.text_ t ]
