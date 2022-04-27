module Deku.DOM.Elt.Mark where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Mark_

mark
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Mark_)
  -> seed
  -> Element lock payload
mark attributes seed = elementify "mark" attributes (plant seed)

mark_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
mark_ = mark empty

