module Deku.DOM.Elt.Video where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Video_

video
  :: forall payload
   . Event (Attribute Video_)
  -> Array (Domable payload)
  -> Domable payload
video attributes kids = Domable
  ( Element'
      ( DC.elementify "video" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

video_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
video_ = video empty

video__
  :: forall payload
   . String
  -> Domable payload
video__ t = video_ [ DC.text_ t ]
