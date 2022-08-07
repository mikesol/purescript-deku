module Deku.DOM.Elt.Address where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Address_

address
  :: forall lock payload
   . AnEvent M (Attribute Address_)
  -> Array (Domable lock payload)
  -> Domable lock payload
address attributes kids = Element'
  (elementify "address" attributes (fixed kids))

address_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
address_ = address empty

