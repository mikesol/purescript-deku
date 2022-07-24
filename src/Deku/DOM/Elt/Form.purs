module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Form_

form
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Form_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
form attributes kids = Element' (elementify "form" attributes (fixed kids))

form_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
form_ = form empty

