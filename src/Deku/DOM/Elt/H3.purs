module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data H3_

h3
  :: Array (Event (Attribute H3_))
  -> Array Nut
  -> Nut
h3 = DC.elementify2 "h3"

h3_
  :: Array Nut
  -> Nut
h3_ = h3 empty

h3__
  :: String
  -> Nut
h3__ t = h3_ [ DC.text_ t ]
