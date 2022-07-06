module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Bdi_

bdi
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Bdi_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
bdi attributes kids = Element' (elementify "bdi" attributes (fixed kids))

bdi_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
bdi_ = bdi empty

