module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Output_

output
  :: forall event payload
   . IsEvent event
  => event (Attribute Output_)
  -> Array (Element event payload)
  -> Element event payload
output = elementify "output"

output_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
output_ = output empty
