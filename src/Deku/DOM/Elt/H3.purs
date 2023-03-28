module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data H3_

h3
  :: Event (Attribute H3_)
  -> Array Domable
  -> Domable
h3 = DC.elementify2 "h3"

h3_
  :: Array Domable
  -> Domable
h3_ = h3 empty

h3__
  :: String
  -> Domable
h3__ t = h3_ [ DC.text_ t ]
