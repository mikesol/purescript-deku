module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Track_

track
  :: forall event payload
   . IsEvent event
  => event (Attribute Track_)
  -> Array (Element event payload)
  -> Element event payload
track = elementify "track"

track_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
track_ = track empty
