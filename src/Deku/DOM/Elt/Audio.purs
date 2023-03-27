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
  :: Event (Attribute Audio_)
  -> Array Domable
  -> Domable
audio attributes kids = Domable
  ( Element'
      ( DC.elementify "audio" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

audio_
  :: Array Domable
  -> Domable
audio_ = audio empty

audio__
  :: String
  -> Domable
audio__ t = audio_ [ DC.text_ t ]
