module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Optgroup_

optgroup
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Optgroup_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
optgroup attributes kids = Element' (elementify "optgroup" attributes (fixed kids))

optgroup_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
optgroup_ = optgroup empty

