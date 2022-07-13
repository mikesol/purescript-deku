module Deku.DOM.Elt.Time where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Time_

time
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Time_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
time attributes kids = Element' (elementify "time" attributes (fixed kids))

time_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
time_ = time empty

