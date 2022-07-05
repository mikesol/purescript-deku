module Deku.DOM.Elt.I where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data I_

i
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute I_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
i attributes kids = Element' (elementify "i" attributes (fixed kids))

i_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
i_ = i empty

