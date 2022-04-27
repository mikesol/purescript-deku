module Deku.DOM.Elt.Sup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Sup_

sup
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Sup_)
  -> seed
  -> Element lock payload
sup attributes seed = elementify "sup" attributes (plant seed)

sup_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
sup_ = sup empty

