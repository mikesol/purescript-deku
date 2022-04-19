module Deku.DOM.Elt.Map where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Map_

map
  :: forall event payload
   . IsEvent event
  => event (Attribute Map_)
  -> Array (Element event payload)
  -> Element event payload
map = elementify "map"

map_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
map_ = map empty
