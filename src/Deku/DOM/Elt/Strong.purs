module Deku.DOM.Elt.Strong where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Strong_

strong
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Strong_)
  -> seed
  -> Element lock payload
strong attributes seed = elementify "strong" attributes (plant seed)

strong_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
strong_ = strong empty

