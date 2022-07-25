module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Body_

body
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Body_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
body attributes kids = Element' (elementify "body" attributes (fixed kids))

body_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
body_ = body empty

