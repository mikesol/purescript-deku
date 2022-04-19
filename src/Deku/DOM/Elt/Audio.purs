module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Audio_

audio
  :: forall event payload
   . IsEvent event
  => event (Attribute Audio_)
  -> Array (Element event payload)
  -> Element event payload
audio = elementify "audio"

audio_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
audio_ = audio empty
