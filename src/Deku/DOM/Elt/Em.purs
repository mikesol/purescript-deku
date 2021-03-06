module Deku.DOM.Elt.Em where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Em_

em
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Em_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
em attributes kids = Element' (elementify "em" attributes (fixed kids))

em_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
em_ = em empty

