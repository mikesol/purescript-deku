module Deku.DOM.Elt.Address where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Address_

address
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Address_)
  -> seed
  -> Element lock payload
address attributes seed = elementify "address" attributes (plant seed)

address_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
address_ = address empty

