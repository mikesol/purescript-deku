module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data B_

b
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute B_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
b attributes kids = Element' (elementify "b" attributes (fixed kids))

b_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
b_ = b empty

