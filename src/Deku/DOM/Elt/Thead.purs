module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Thead_

thead
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Thead_)
  -> seed
  -> Element lock payload
thead attributes seed = elementify "thead" attributes (plant seed)

thead_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
thead_ = thead empty

