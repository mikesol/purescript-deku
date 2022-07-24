module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Samp_

samp
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Samp_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
samp attributes kids = Element' (elementify "samp" attributes (fixed kids))

samp_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
samp_ = samp empty

