module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Hr_

hr
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Hr_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
hr attributes kids = Element' (elementify "hr" attributes (fixed kids))

hr_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
hr_ = hr empty

