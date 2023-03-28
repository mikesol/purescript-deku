module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Col_

col
  :: Event (Attribute Col_)
  -> Array Domable
  -> Domable
col = DC.elementify2 "col"

col_
  :: Array Domable
  -> Domable
col_ = col empty

col__
  :: String
  -> Domable
col__ t = col_ [ DC.text_ t ]
