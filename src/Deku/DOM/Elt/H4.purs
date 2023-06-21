module Deku.DOM.Elt.H4 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

h4
  :: Array (Attribute Tags.H4_)
  -> Array Nut
  -> Nut
h4 = DC.elementify3 "h4"

h4_
  :: Array Nut
  -> Nut
h4_ = h4 empty

h4__
  :: String
  -> Nut
h4__ t = h4_ [ DC.text_ t ]
