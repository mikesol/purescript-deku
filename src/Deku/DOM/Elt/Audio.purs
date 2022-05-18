module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Audio_

audio
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Audio_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
audio attributes kids = Element' (elementify "audio" attributes (fixed kids))

audio_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
audio_ = audio empty

