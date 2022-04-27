module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Section_

section
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Section_)
  -> seed
  -> Element lock payload
section attributes seed = elementify "section" attributes (plant seed)

section_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
section_ = section empty

