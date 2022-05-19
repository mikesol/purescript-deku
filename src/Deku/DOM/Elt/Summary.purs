module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Summary_

summary
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Summary_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
summary attributes kids = Element' (elementify "summary" attributes (fixed kids))

summary_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
summary_ = summary empty

