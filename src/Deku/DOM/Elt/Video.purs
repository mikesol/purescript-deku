module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Video_

video
  :: forall event payload
   . IsEvent event
  => event (Attribute Video_)
  -> Array (Element event payload)
  -> Element event payload
video = elementify "video"

video_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
video_ = video empty
