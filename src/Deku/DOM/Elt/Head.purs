module Deku.DOM.Elt.Head where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Head_

head
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Head_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
head attributes kids = Element' (elementify "head" attributes (fixed kids))

head_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
head_ = head empty

