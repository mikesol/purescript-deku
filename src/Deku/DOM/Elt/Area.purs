module Deku.DOM.Elt.Area where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Area_

area
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Area_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
area attributes kids = Element' (elementify "area" attributes (fixed kids))

area_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
area_ = area empty

