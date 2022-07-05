module Deku.DOM.Elt.U where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data U_

u
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute U_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
u attributes kids = Element' (elementify "u" attributes (fixed kids))

u_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
u_ = u empty

