module Deku.DOM.Elt.A where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data A_

a
  :: Event (Attribute A_)
  -> Array Domable
  -> Domable
a = DC.elementify2 "a"

a_
  :: Array Domable
  -> Domable
a_ = a empty

a__
  :: String
  -> Domable
a__ t = a_ [ DC.text_ t ]
