module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Track_

track
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Track_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
track attributes kids = Element' (elementify "track" attributes (fixed kids))

track_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
track_ = track empty

