module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Details_

details
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Details_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
details attributes kids = Element' (elementify "details" attributes (fixed kids))

details_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
details_ = details empty

