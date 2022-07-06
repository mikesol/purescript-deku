module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Output_

output
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Output_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
output attributes kids = Element' (elementify "output" attributes (fixed kids))

output_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
output_ = output empty

