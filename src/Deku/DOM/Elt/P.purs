module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data P_

p
  :: Event (Attribute P_)
  -> Array Domable
  -> Domable
p = DC.elementify2 "p"

p_
  :: Array Domable
  -> Domable
p_ = p empty

p__
  :: String
  -> Domable
p__ t = p_ [ DC.text_ t ]
