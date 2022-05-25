module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Template_

template
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Template_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
template attributes kids = Element'
  (elementify "template" attributes (fixed kids))

template_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
template_ = template empty

