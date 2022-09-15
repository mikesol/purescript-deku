module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Canvas_

canvas
  :: forall lock payload
   . Event (Attribute Canvas_)
  -> Array (Domable lock payload)
  -> Domable lock payload
canvas attributes kids = Domable (Element' (elementify "canvas" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

canvas_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
canvas_ = canvas empty

