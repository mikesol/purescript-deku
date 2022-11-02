module Deku.DOM.Elt.Video where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Video_

video
  :: forall lock payload
   . Event (Attribute Video_)
  -> Array (Domable lock payload)
  -> Domable lock payload
video attributes kids = Domable
  ( Element'
      ( elementify "video" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

video_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
video_ = video empty

