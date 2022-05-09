module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Audio_

audio
  :: forall lock payload
   . Event (Attribute Audio_)
  -> Array (Domable lock payload)
  -> Domable lock payload
audio attributes kids = Element' (elementify "audio" attributes (FixedChildren' (FixedChildren kids)))

audio_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
audio_ = audio empty

