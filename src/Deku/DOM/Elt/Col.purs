module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Col_

col
  :: forall event payload
   . IsEvent event
  => event (Attribute Col_)
  -> Array (Element event payload)
  -> Element event payload
col = elementify "col"

col_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
col_ = col empty
