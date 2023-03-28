module Deku.DOM.Elt.H4 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data H4_

h4
  :: Event (Attribute H4_)
  -> Array Domable
  -> Domable
h4 = DC.elementify2 "h4"

h4_
  :: Array Domable
  -> Domable
h4_ = h4 empty

h4__
  :: String
  -> Domable
h4__ t = h4_ [ DC.text_ t ]
