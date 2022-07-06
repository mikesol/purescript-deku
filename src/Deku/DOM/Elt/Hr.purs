module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Hr_

hr
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Hr_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
hr attributes kids = Element' (elementify "hr" attributes (fixed kids))

hr_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
hr_ = hr empty

