module Deku.DOM.Elt.Mark where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Mark_

mark
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Mark_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
mark attributes kids = Element' (elementify "mark" attributes (fixed kids))

mark_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
mark_ = mark empty

