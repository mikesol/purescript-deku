module Deku.DOM.Elt.A where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data A_

a
  :: forall event payload
   . IsEvent event
  => event (Attribute A_)
  -> Array (Element event payload)
  -> Element event payload
a = elementify "a"

a_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
a_ = a empty
