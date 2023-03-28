module Deku.DOM.Elt.Small where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Small_

small
  :: Event (Attribute Small_)
  -> Array Domable
  -> Domable
small = DC.elementify2 "small"

small_
  :: Array Domable
  -> Domable
small_ = small empty

small__
  :: String
  -> Domable
small__ t = small_ [ DC.text_ t ]
