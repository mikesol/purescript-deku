module Deku.DOM.Elt.Dt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Dt_

dt
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Dt_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
dt attributes kids = Element' (elementify "dt" attributes (fixed kids))

dt_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
dt_ = dt empty

