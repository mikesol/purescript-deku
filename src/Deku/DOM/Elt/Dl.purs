module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Dl_

dl
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Dl_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
dl attributes kids = Element' (elementify "dl" attributes (fixed kids))

dl_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
dl_ = dl empty

