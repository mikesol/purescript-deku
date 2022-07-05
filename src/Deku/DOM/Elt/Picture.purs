module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Picture_

picture
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Picture_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
picture attributes kids = Element' (elementify "picture" attributes (fixed kids))

picture_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
picture_ = picture empty

