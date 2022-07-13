module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Xdata_

xdata
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Xdata_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
xdata attributes kids = Element' (elementify "data" attributes (fixed kids))

xdata_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
xdata_ = xdata empty

