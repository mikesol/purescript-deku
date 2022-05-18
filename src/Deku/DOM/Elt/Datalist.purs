module Deku.DOM.Elt.Datalist where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Datalist_

datalist
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Datalist_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
datalist attributes kids = Element' (elementify "datalist" attributes (fixed kids))

datalist_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
datalist_ = datalist empty

