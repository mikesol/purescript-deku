module Deku.DOM.Elt.H6 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data H6_

h6
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute H6_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
h6 attributes kids = Element' (elementify "h6" attributes (fixed kids))

h6_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
h6_ = h6 empty

