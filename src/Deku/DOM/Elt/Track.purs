module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Track_

track
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Track_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
track attributes kids = Element' (elementify "track" attributes (fixed kids))

track_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
track_ = track empty

