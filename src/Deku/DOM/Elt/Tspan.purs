module Deku.DOM.Elt.Tspan where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Tspan_

tspan
  :: Event (Attribute Tspan_)
  -> Array Domable
  -> Domable
tspan = DC.elementify2 "tspan"

tspan_
  :: Array Domable
  -> Domable
tspan_ = tspan empty

tspan__
  :: String
  -> Domable
tspan__ t = tspan_ [ DC.text_ t ]
