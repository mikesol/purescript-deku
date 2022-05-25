module Deku.DOM.Elt.Progress where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Progress_

progress
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Progress_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
progress attributes kids = Element'
  (elementify "progress" attributes (fixed kids))

progress_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
progress_ = progress empty

