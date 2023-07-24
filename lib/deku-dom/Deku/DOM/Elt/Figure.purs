module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Figure_

figure :: Array (FRP.Event.Event (Deku.Attribute.Attribute Figure_)) -> Array Nut -> Nut
figure = DC.elementify2 "figure"

figure_ :: Array Nut -> Nut
figure_ = figure empty

figure__ :: String -> Nut
figure__ t = figure_ [ DC.text_ t ]
