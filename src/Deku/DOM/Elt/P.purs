module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data P_

p
  :: Array (Event (Attribute P_))
  -> Array Nut
  -> Nut
p = DC.elementify2 "p"

p_
  :: Array Nut
  -> Nut
p_ = p empty

p__
  :: String
  -> Nut
p__ t = p_ [ DC.text_ t ]
