module Deku.DOM.Elt.Small where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Small_

small
  :: forall event payload
   . IsEvent event
  => event (Attribute Small_)
  -> Array (Element event payload)
  -> Element event payload
small = elementify "small"

small_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
small_ = small empty
