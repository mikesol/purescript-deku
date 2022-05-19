module Deku.DOM.Elt.Del where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Del_

del
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Del_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
del attributes kids = Element' (elementify "del" attributes (fixed kids))

del_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
del_ = del empty

