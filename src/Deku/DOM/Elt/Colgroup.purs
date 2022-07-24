module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Colgroup_

colgroup
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Colgroup_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
colgroup attributes kids = Element'
  (elementify "colgroup" attributes (fixed kids))

colgroup_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
colgroup_ = colgroup empty

