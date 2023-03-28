module Deku.DOM.Elt.G where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data G_

g
  :: Event (Attribute G_)
  -> Array Domable
  -> Domable
g = DC.elementify2 "g"

g_
  :: Array Domable
  -> Domable
g_ = g empty

g__
  :: String
  -> Domable
g__ t = g_ [ DC.text_ t ]
