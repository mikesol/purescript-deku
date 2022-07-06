module Deku.DOM.Elt.Address where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Address_

address
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Address_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
address attributes kids = Element' (elementify "address" attributes (fixed kids))

address_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
address_ = address empty

