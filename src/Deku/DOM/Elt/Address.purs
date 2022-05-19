module Deku.DOM.Elt.Address where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Address_

address
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Address_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
address attributes kids = Element' (elementify "address" attributes (fixed kids))

address_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
address_ = address empty

