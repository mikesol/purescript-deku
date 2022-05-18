module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Dir_

dir
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Dir_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
dir attributes kids = Element' (elementify "dir" attributes (fixed kids))

dir_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
dir_ = dir empty

