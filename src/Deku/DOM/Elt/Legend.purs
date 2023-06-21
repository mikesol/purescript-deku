module Deku.DOM.Elt.Legend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

legend
  :: Array (Attribute Tags.Legend_)
  -> Array Nut
  -> Nut
legend = DC.elementify3 "legend"

legend_
  :: Array Nut
  -> Nut
legend_ = legend empty

legend__
  :: String
  -> Nut
legend__ t = legend_ [ DC.text_ t ]
