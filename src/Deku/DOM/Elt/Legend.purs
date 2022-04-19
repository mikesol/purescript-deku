module Deku.DOM.Elt.Legend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Legend_

legend
  :: forall event payload
   . IsEvent event
  => event (Attribute Legend_)
  -> Array (Element event payload)
  -> Element event payload
legend = elementify "legend"

legend_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
legend_ = legend empty
