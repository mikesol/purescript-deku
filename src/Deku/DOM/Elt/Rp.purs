module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Rp_

rp
  :: Event (Attribute Rp_)
  -> Array Domable
  -> Domable
rp = DC.elementify2 "rp"

rp_
  :: Array Domable
  -> Domable
rp_ = rp empty

rp__
  :: String
  -> Domable
rp__ t = rp_ [ DC.text_ t ]
