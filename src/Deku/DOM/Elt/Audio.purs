module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Audio_

audio
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Audio_)
  -> seed
  -> Element lock payload
audio attributes seed = elementify "audio" attributes (plant seed)

audio_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
audio_ = audio empty

