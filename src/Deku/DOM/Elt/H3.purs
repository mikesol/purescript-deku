module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data H3_

h3
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute H3_)
  -> seed
  -> Element lock payload
h3 attributes seed = elementify "h3" attributes (plant seed)

h3_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
h3_ = h3 empty

