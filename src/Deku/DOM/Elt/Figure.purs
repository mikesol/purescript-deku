module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

figure
  :: Array (Event (Attribute Tags.Figure_))
  -> Array Nut
  -> Nut
figure = DC.elementify3 "figure"

figure_
  :: Array Nut
  -> Nut
figure_ = figure empty

figure__
  :: String
  -> Nut
figure__ t = figure_ [ DC.text_ t ]
