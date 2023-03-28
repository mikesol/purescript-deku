module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Details_

details
  :: Event (Attribute Details_)
  -> Array Domable
  -> Domable
details = DC.elementify2 "details"

details_
  :: Array Domable
  -> Domable
details_ = details empty

details__
  :: String
  -> Domable
details__ t = details_ [ DC.text_ t ]
