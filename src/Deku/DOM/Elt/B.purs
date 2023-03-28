module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data B_

b
  :: Event (Attribute B_)
  -> Array Domable
  -> Domable
b = DC.elementify2 "b"

b_
  :: Array Domable
  -> Domable
b_ = b empty

b__
  :: String
  -> Domable
b__ t = b_ [ DC.text_ t ]
