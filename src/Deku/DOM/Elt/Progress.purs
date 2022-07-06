module Deku.DOM.Elt.Progress where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Progress_

progress
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Progress_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
progress attributes kids = Element' (elementify "progress" attributes (fixed kids))

progress_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
progress_ = progress empty

