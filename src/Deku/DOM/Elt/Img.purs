module Deku.DOM.Elt.Img where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Img_

img
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Img_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
img attributes kids = Element' (elementify "img" attributes (fixed kids))

img_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
img_ = img empty

