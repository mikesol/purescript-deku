module Deku.DOM.Elt.Map where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Map_

map
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Map_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
map attributes kids = Element' (elementify "map" attributes (fixed kids))

map_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
map_ = map empty

