module Deku.DOM.Elt.Mark where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Mark_

mark
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Mark_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
mark attributes kids = Element' (elementify "mark" attributes (fixed kids))

mark_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
mark_ = mark empty

