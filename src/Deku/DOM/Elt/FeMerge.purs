module Deku.DOM.Elt.FeMerge where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeMerge_

feMerge
  :: Event (Attribute FeMerge_)
  -> Array Domable
  -> Domable
feMerge = DC.elementify2 "feMerge"

feMerge_
  :: Array Domable
  -> Domable
feMerge_ = feMerge empty

feMerge__
  :: String
  -> Domable
feMerge__ t = feMerge_ [ DC.text_ t ]
