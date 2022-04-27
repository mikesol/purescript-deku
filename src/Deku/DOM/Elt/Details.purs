module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Details_

details
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Details_)
  -> seed
  -> Element lock payload
details attributes seed = elementify "details" attributes (plant seed)

details_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
details_ = details empty

