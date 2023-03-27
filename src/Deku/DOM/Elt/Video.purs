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
  :: Event (Attribute Video_)
  -> Array Domable
  -> Domable
video attributes kids = Domable
  ( Element'
      ( DC.elementify "video" attributes
          ( (coerce :: Domable' payload -> Domable)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

video_
  :: Array Domable
  -> Domable
video_ = video empty

video__
  :: String
  -> Domable
video__ t = video_ [ DC.text_ t ]
