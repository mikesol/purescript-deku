module Deku.DOM.Elt.A where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data A_

a
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute A_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
a attributes kids = Element' (elementify "a" attributes (fixed kids))

a_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
a_ = a empty

