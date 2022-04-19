module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data H3_

h3
  :: forall event payload
   . IsEvent event
  => event (Attribute H3_)
  -> Array (Element event payload)
  -> Element event payload
h3 = elementify "h3"

h3_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
h3_ = h3 empty
