module Deku.DOM.Elt.H6 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data H6_

h6
  :: forall event payload
   . IsEvent event
  => event (Attribute H6_)
  -> Array (Element event payload)
  -> Element event payload
h6 = elementify "h6"

h6_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
h6_ = h6 empty
