module Deku.DOM.Elt.Marker where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Marker_

marker
  :: Event (Attribute Marker_)
  -> Array Domable
  -> Domable
marker = DC.elementify2 "marker"

marker_
  :: Array Domable
  -> Domable
marker_ = marker empty

marker__
  :: String
  -> Domable
marker__ t = marker_ [ DC.text_ t ]
