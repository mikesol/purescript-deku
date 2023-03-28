module Deku.DOM.Elt.S where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data S_

s
  :: Event (Attribute S_)
  -> Array Domable
  -> Domable
s = DC.elementify2 "s"

s_
  :: Array Domable
  -> Domable
s_ = s empty

s__
  :: String
  -> Domable
s__ t = s_ [ DC.text_ t ]
