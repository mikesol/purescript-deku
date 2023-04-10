module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Details_

details
  :: Array (Event (Attribute Details_))
  -> Array Nut
  -> Nut
details = DC.elementify2 "details"

details_
  :: Array Nut
  -> Nut
details_ = details empty

details__
  :: String
  -> Nut
details__ t = details_ [ DC.text_ t ]
