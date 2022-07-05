module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data H3_

h3
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute H3_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
h3 attributes kids = Element' (elementify "h3" attributes (fixed kids))

h3_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
h3_ = h3 empty

