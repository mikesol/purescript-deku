module Deku.DOM.Elt.Time where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Time_

time
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Time_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
time attributes kids = Element' (elementify "time" attributes (fixed kids))

time_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
time_ = time empty

