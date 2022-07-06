module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Audio_

audio
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Audio_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
audio attributes kids = Element' (elementify "audio" attributes (fixed kids))

audio_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
audio_ = audio empty

