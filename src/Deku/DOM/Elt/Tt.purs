module Deku.DOM.Elt.Tt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Tt_

tt
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Tt_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
tt attributes kids = Element' (elementify "tt" attributes (fixed kids))

tt_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
tt_ = tt empty

