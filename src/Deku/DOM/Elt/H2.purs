module Deku.DOM.Elt.H2 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data H2_

h2
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute H2_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
h2 attributes kids = Element' (elementify "h2" attributes (fixed kids))

h2_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
h2_ = h2 empty

