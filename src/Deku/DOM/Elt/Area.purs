module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Area_

area
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Area_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
area attributes kids = Element' (elementify "area" attributes (fixed kids))

area_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
area_ = area empty

