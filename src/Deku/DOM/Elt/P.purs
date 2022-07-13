module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data P_

p
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute P_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
p attributes kids = Element' (elementify "p" attributes (fixed kids))

p_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
p_ = p empty

