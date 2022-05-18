module Deku.DOM.Elt.Caption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Caption_

caption
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Caption_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
caption attributes kids = Element' (elementify "caption" attributes (fixed kids))

caption_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
caption_ = caption empty

