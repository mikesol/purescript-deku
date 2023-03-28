module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Xdata_

xdata
  :: Event (Attribute Xdata_)
  -> Array Domable
  -> Domable
xdata = DC.elementify2 "data"

xdata_
  :: Array Domable
  -> Domable
xdata_ = xdata empty

xdata__
  :: String
  -> Domable
xdata__ t = xdata_ [ DC.text_ t ]
