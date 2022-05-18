module Deku.DOM.Elt.S where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data S_

s
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute S_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
s attributes kids = Element' (elementify "s" attributes (fixed kids))

s_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
s_ = s empty

