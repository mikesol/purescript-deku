module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data H1_

h1
  :: Event (Attribute H1_)
  -> Array Domable
  -> Domable
h1 = DC.elementify2 "h1"

h1_
  :: Array Domable
  -> Domable
h1_ = h1 empty

h1__
  :: String
  -> Domable
h1__ t = h1_ [ DC.text_ t ]
