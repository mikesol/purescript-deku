module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Bdi_

bdi
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Bdi_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
bdi attributes kids = Element' (elementify "bdi" attributes (fixed kids))

bdi_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
bdi_ = bdi empty

