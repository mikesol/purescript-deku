module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

output
  :: Array (Attribute Tags.Output_)
  -> Array Nut
  -> Nut
output = DC.elementify3 "output"

output_
  :: Array Nut
  -> Nut
output_ = output empty

output__
  :: String
  -> Nut
output__ t = output_ [ DC.text_ t ]
