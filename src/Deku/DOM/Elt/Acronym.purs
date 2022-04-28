module Deku.DOM.Elt.Acronym where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Acronym_

acronym
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Acronym_)
  -> seed
  -> Element lock payload
acronym attributes seed = elementify "acronym" attributes (plant seed)

acronym_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
acronym_ = acronym empty

