module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Figure_

figure
  :: Event (Attribute Figure_)
  -> Array Domable
  -> Domable
figure = DC.elementify2 "figure"

figure_
  :: Array Domable
  -> Domable
figure_ = figure empty

figure__
  :: String
  -> Domable
figure__ t = figure_ [ DC.text_ t ]
