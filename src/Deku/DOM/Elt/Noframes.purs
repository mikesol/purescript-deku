module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Noframes_

noframes
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Noframes_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
noframes attributes kids = Element' (elementify "noframes" attributes (fixed kids))

noframes_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
noframes_ = noframes empty

