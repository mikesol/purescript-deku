module Deku.DOM.Elt.H5 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data H5_

h5
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute H5_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
h5 attributes kids = Element' (elementify "h5" attributes (fixed kids))

h5_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
h5_ = h5 empty

