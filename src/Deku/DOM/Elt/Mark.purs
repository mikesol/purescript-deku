module Deku.DOM.Elt.Mark where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Mark_

mark
  :: forall event payload
   . IsEvent event
  => event (Attribute Mark_)
  -> Array (Element event payload)
  -> Element event payload
mark = elementify "mark"

mark_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
mark_ = mark empty
