module Deku.DOM.Elt.Figure where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Figure_

figure
  :: forall event payload
   . IsEvent event
  => event (Attribute Figure_)
  -> Array (Element event payload)
  -> Element event payload
figure = elementify "figure"

figure_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
figure_ = figure empty
