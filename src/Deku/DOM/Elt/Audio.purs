module Deku.DOM.Elt.Audio where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Audio_

audio
  :: forall lock payload
   . Event (Attribute Audio_)
  -> Array (Domable lock payload)
  -> Domable lock payload
audio attributes kids = Domable
  ( Element'
      ( DC.elementify "audio" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

audio_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
audio_ = audio empty

audio__
  :: forall lock payload
   . String
  -> Domable lock payload
audio__ t = audio_ [ DC.text_ t ]
