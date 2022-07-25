module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Rp_

rp
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Rp_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
rp attributes kids = Element' (elementify "rp" attributes (fixed kids))

rp_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
rp_ = rp empty

