module Deku.DOM.Elt.Th where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Th_

th
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Th_)
  -> seed
  -> Element lock payload
th attributes seed = elementify "th" attributes (plant seed)

th_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
th_ = th empty

