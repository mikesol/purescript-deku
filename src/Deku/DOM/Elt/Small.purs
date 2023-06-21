module Deku.DOM.Elt.Small where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

small
  :: Array (Attribute Tags.Small_)
  -> Array Nut
  -> Nut
small = DC.elementify3 "small"

small_
  :: Array Nut
  -> Nut
small_ = small empty

small__
  :: String
  -> Nut
small__ t = small_ [ DC.text_ t ]
