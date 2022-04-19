module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data B_

b
  :: forall event payload
   . IsEvent event
  => event (Attribute B_)
  -> Array (Element event payload)
  -> Element event payload
b = elementify "b"

b_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
b_ = b empty
