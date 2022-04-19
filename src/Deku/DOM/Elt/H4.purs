module Deku.DOM.Elt.H4 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data H4_

h4
  :: forall event payload
   . IsEvent event
  => event (Attribute H4_)
  -> Array (Element event payload)
  -> Element event payload
h4 = elementify "h4"

h4_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
h4_ = h4 empty
