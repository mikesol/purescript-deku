module Deku.DOM.Elt.H2 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data H2_

h2
  :: Event (Attribute H2_)
  -> Array Domable
  -> Domable
h2 = DC.elementify2 "h2"

h2_
  :: Array Domable
  -> Domable
h2_ = h2 empty

h2__
  :: String
  -> Domable
h2__ t = h2_ [ DC.text_ t ]
