module Deku.DOM.Elt.Center where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Center_

center
  :: forall event payload
   . IsEvent event
  => event (Attribute Center_)
  -> Array (Element event payload)
  -> Element event payload
center = elementify "center"

center_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
center_ = center empty
