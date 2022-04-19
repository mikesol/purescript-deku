module Deku.DOM.Elt.Frame where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Frame_

frame
  :: forall event payload
   . IsEvent event
  => event (Attribute Frame_)
  -> Array (Element event payload)
  -> Element event payload
frame = elementify "frame"

frame_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
frame_ = frame empty
