module Deku.DOM.Elt.Q where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Q_

q
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Q_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
q attributes kids = Element' (elementify "q" attributes (fixed kids))

q_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
q_ = q empty

