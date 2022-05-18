module Deku.DOM.Elt.Textarea where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Textarea_

textarea
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Textarea_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
textarea attributes kids = Element' (elementify "textarea" attributes (fixed kids))

textarea_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
textarea_ = textarea empty

