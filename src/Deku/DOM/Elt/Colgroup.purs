module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Colgroup_

colgroup
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Colgroup_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
colgroup attributes kids = Element' (elementify "colgroup" attributes (fixed kids))

colgroup_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
colgroup_ = colgroup empty

