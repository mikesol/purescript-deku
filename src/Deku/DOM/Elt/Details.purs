module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Details_

details
  :: forall event payload
   . IsEvent event
  => event (Attribute Details_)
  -> Array (Element event payload)
  -> Element event payload
details = elementify "details"

details_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
details_ = details empty
