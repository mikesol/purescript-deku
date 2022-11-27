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
  :: forall lock payload
   . Event (Attribute Track_)
  -> Array (Domable lock payload)
  -> Domable lock payload
track attributes kids = Domable
  ( Element'
      ( DC.elementify "track" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

track_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
track_ = track empty


track__
  :: forall lock payload
   . String
  -> Domable lock payload
track__ t = track_ [ DC.text_ t ]
