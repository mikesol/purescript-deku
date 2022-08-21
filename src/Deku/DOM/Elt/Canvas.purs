module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Canvas_

canvas
  :: forall lock payload
   . AnEvent Zora (Attribute Canvas_)
  -> Array (Domable lock payload)
  -> Domable lock payload
canvas attributes kids = Element' (elementify "canvas" attributes (fixed kids))

canvas_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
canvas_ = canvas empty

