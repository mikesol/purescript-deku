module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Output_

output
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Output_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
output attributes kids = Element' (elementify "output" attributes (fixed kids))

output_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
output_ = output empty

