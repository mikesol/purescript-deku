module Deku.DOM.Elt.Th where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Th_

th
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Th_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
th attributes kids = Element' (elementify "th" attributes (fixed kids))

th_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
th_ = th empty

