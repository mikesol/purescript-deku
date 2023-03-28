module Deku.DOM.Elt.Q where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Q_

q
  :: Event (Attribute Q_)
  -> Array Domable
  -> Domable
q = DC.elementify2 "q"

q_
  :: Array Domable
  -> Domable
q_ = q empty

q__
  :: String
  -> Domable
q__ t = q_ [ DC.text_ t ]
