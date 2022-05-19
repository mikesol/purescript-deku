module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Label_

label
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Label_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
label attributes kids = Element' (elementify "label" attributes (fixed kids))

label_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
label_ = label empty

