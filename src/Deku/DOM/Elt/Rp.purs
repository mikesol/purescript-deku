module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Rp_

rp
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Rp_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
rp attributes kids = Element' (elementify "rp" attributes (fixed kids))

rp_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
rp_ = rp empty

