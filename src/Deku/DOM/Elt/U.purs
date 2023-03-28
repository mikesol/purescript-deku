module Deku.DOM.Elt.U where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data U_

u
  :: Event (Attribute U_)
  -> Array Domable
  -> Domable
u = DC.elementify2 "u"

u_
  :: Array Domable
  -> Domable
u_ = u empty

u__
  :: String
  -> Domable
u__ t = u_ [ DC.text_ t ]
