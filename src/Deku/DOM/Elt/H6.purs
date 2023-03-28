module Deku.DOM.Elt.H6 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data H6_

h6
  :: Event (Attribute H6_)
  -> Array Domable
  -> Domable
h6 = DC.elementify2 "h6"

h6_
  :: Array Domable
  -> Domable
h6_ = h6 empty

h6__
  :: String
  -> Domable
h6__ t = h6_ [ DC.text_ t ]
