module Deku.DOM.Elt.FeOffset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeOffset_

feOffset
  :: Event (Attribute FeOffset_)
  -> Array Domable
  -> Domable
feOffset = DC.elementify2 "feOffset"

feOffset_
  :: Array Domable
  -> Domable
feOffset_ = feOffset empty

feOffset__
  :: String
  -> Domable
feOffset__ t = feOffset_ [ DC.text_ t ]
