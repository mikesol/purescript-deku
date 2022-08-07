module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Audio_

audio
  :: forall lock payload
   . AnEvent M (Attribute Audio_)
  -> Array (Domable lock payload)
  -> Domable lock payload
audio attributes kids = Element' (elementify "audio" attributes (fixed kids))

audio_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
audio_ = audio empty

