module Deku.DOM.Elt.H2 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data H2_

h2
  :: forall event payload
   . IsEvent event
  => event (Attribute H2_)
  -> Array (Element event payload)
  -> Element event payload
h2 = elementify "h2"

h2_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
h2_ = h2 empty
