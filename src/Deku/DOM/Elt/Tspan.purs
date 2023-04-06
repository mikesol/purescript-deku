module Deku.DOM.Elt.Tspan where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Tspan_

tspan
  :: Array (Event (Attribute Tspan_))
  -> Array Nut
  -> Nut
tspan = DC.elementify2 "tspan"

tspan_
  :: Array Nut
  -> Nut
tspan_ = tspan empty

tspan__
  :: String
  -> Nut
tspan__ t = tspan_ [ DC.text_ t ]
