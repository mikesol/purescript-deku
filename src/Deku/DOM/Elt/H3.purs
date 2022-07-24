module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data H3_

h3
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute H3_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
h3 attributes kids = Element' (elementify "h3" attributes (fixed kids))

h3_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
h3_ = h3 empty

