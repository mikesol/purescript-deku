module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Canvas_

canvas
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Canvas_)
  -> seed
  -> Element lock payload
canvas attributes seed = elementify "canvas" attributes (plant seed)

canvas_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
canvas_ = canvas empty

