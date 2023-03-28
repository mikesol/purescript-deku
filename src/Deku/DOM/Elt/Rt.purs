module Deku.DOM.Elt.Rt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Rt_

rt
  :: Event (Attribute Rt_)
  -> Array Domable
  -> Domable
rt = DC.elementify2 "rt"

rt_
  :: Array Domable
  -> Domable
rt_ = rt empty

rt__
  :: String
  -> Domable
rt__ t = rt_ [ DC.text_ t ]
