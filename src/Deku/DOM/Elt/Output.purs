module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Output_

output
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Output_)
  -> seed
  -> Element lock payload
output attributes seed = elementify "output" attributes (plant seed)

output_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
output_ = output empty

