module Deku.DOM.Elt.H2 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

h2
  :: Array (Attribute Tags.H2_)
  -> Array Nut
  -> Nut
h2 = DC.elementify3 "h2"

h2_
  :: Array Nut
  -> Nut
h2_ = h2 empty

h2__
  :: String
  -> Nut
h2__ t = h2_ [ DC.text_ t ]
