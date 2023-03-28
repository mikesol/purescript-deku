module Deku.DOM.Elt.Legend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Legend_

legend
  :: Event (Attribute Legend_)
  -> Array Domable
  -> Domable
legend = DC.elementify2 "legend"

legend_
  :: Array Domable
  -> Domable
legend_ = legend empty

legend__
  :: String
  -> Domable
legend__ t = legend_ [ DC.text_ t ]
