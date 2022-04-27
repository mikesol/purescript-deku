module Deku.DOM.Elt.Button where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Button_

button
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Button_)
  -> seed
  -> Element lock payload
button attributes seed = elementify "button" attributes (plant seed)

button_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
button_ = button empty

