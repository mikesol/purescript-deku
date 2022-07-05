module Deku.DOM.Elt.Rt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Rt_

rt
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Rt_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
rt attributes kids = Element' (elementify "rt" attributes (fixed kids))

rt_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
rt_ = rt empty

