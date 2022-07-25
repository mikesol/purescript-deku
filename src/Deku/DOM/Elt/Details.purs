module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Details_

details
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Details_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
details attributes kids = Element'
  (elementify "details" attributes (fixed kids))

details_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
details_ = details empty

