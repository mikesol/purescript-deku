module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Hr_

hr
  :: forall event payload
   . IsEvent event
  => event (Attribute Hr_)
  -> Array (Element event payload)
  -> Element event payload
hr = elementify "hr"

hr_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
hr_ = hr empty
