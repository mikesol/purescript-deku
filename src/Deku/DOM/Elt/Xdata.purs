module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Xdata_

xdata
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Xdata_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
xdata attributes kids = Element' (elementify "data" attributes (fixed kids))

xdata_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
xdata_ = xdata empty

