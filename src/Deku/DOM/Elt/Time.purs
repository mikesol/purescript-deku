module Deku.DOM.Elt.Time where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Time_

time
  :: forall event payload
   . IsEvent event
  => event (Attribute Time_)
  -> Array (Element event payload)
  -> Element event payload
time = elementify "time"

time_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
time_ = time empty
