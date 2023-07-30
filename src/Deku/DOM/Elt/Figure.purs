module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data Figure_

figure
  :: Array (Attribute Figure_)
  -> Array Nut
  -> Nut
figure = DC.elementify2 "figure"

figure_
  :: Array Nut
  -> Nut
figure_ = figure empty

figure__
  :: String
  -> Nut
figure__ t = figure_ [ DC.text_ t ]
