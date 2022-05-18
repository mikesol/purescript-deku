module Deku.DOM.Elt.Center where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Center_

center
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Center_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
center attributes kids = Element' (elementify "center" attributes (fixed kids))

center_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
center_ = center empty

