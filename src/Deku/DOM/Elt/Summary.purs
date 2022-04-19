module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Summary_

summary
  :: forall event payload
   . IsEvent event
  => event (Attribute Summary_)
  -> Array (Element event payload)
  -> Element event payload
summary = elementify "summary"

summary_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
summary_ = summary empty
