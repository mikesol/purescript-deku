module Deku.DOM.Elt.Track where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Track_

track
  :: forall payload
   . Event (Attribute Track_)
  -> Array (Domable payload)
  -> Domable payload
track attributes kids = Domable
  ( Element'
      ( DC.elementify "track" attributes
          ( (coerce :: Domable' payload -> Domable payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

track_
  :: forall payload
   . Array (Domable payload)
  -> Domable payload
track_ = track empty

track__
  :: forall payload
   . String
  -> Domable payload
track__ t = track_ [ DC.text_ t ]
