module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Audio_

audio
  :: forall lock payload
   . Event (Attribute Audio_)
  -> Array (Domable lock payload)
  -> Domable lock payload
audio attributes kids = Domable (Element' (elementify "audio" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

audio_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
audio_ = audio empty

