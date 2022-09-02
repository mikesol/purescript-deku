module Deku.DOM.Elt.I where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data I_

i
  :: forall lock payload
   . Event (Attribute I_)
  -> Array (Domable lock payload)
  -> Domable lock payload
i attributes kids = Element' (elementify "i" attributes (fixed kids))

i_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
i_ = i empty

