module Deku.DOM.Elt.Progress where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Progress_

progress
  :: forall event payload
   . IsEvent event
  => event (Attribute Progress_)
  -> Array (Element event payload)
  -> Element event payload
progress = elementify "progress"

progress_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
progress_ = progress empty
