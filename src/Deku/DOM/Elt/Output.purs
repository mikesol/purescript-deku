module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Output_

output
  :: Event (Attribute Output_)
  -> Array Domable
  -> Domable
output = DC.elementify2 "output"

output_
  :: Array Domable
  -> Domable
output_ = output empty

output__
  :: String
  -> Domable
output__ t = output_ [ DC.text_ t ]
