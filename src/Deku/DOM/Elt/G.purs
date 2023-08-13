module Deku.DOM.Elt.G where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data G_

g
  :: Array (Poll (Attribute G_))
  -> Array Nut
  -> Nut
g = DC.elementify2 "g"

g_
  :: Array Nut
  -> Nut
g_ = g empty

g__
  :: String
  -> Nut
g__ t = g_ [ DC.text_ t ]
