module Deku.DOM.Elt.Meter where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Meter_

meter
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Meter_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
meter attributes kids = Element' (elementify "meter" attributes (fixed kids))

meter_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
meter_ = meter empty

