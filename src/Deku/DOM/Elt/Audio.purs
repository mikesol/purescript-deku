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
  :: forall payload
   . Event (Attribute Audio_)
  -> Array (Domable payload)
  -> Domable payload
audio attributes kids = Domable
  ( Element'
      ( DC.elementify "audio" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

audio_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
audio_ = audio empty

audio__
  :: forall payload
   . String
  -> Domable payload
audio__ t = audio_ [ DC.text_ t ]
