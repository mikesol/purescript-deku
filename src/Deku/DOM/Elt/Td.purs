module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Td_

td
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Td_)
  -> seed
  -> Element lock payload
td attributes seed = elementify "td" attributes (plant seed)

td_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
td_ = td empty

