module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Canvas_

canvas
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Canvas_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
canvas attributes kids = Element' (elementify "canvas" attributes (fixed kids))

canvas_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
canvas_ = canvas empty

