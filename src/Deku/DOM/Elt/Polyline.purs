module Deku.DOM.Elt.Polyline where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Polyline_

polyline
  :: Event (Attribute Polyline_)
  -> Array Domable
  -> Domable
polyline = DC.elementify2 "polyline"

polyline_
  :: Array Domable
  -> Domable
polyline_ = polyline empty

polyline__
  :: String
  -> Domable
polyline__ t = polyline_ [ DC.text_ t ]
