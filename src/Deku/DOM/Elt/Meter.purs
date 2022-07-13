module Deku.DOM.Elt.Meter where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Meter_

meter
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Meter_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
meter attributes kids = Element' (elementify "meter" attributes (fixed kids))

meter_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
meter_ = meter empty

