module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data B_

b
  :: Array (Event (Attribute B_))
  -> Array Nut
  -> Nut
b = DC.elementify2 "b"

b_
  :: Array Nut
  -> Nut
b_ = b empty

b__
  :: String
  -> Nut
b__ t = b_ [ DC.text_ t ]
