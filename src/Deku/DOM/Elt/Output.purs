module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Output_

output
  :: Array (Event (Attribute Output_))
  -> Array Nut
  -> Nut
output = DC.elementify2 "output"

output_
  :: Array Nut
  -> Nut
output_ = output empty

output__
  :: String
  -> Nut
output__ t = output_ [ DC.text_ t ]
