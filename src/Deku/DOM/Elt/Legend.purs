module Deku.DOM.Elt.Legend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Legend_

legend
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Legend_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
legend attributes kids = Element' (elementify "legend" attributes (fixed kids))

legend_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
legend_ = legend empty

