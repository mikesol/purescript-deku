module Deku.DOM.Elt.I where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data I_

i
  :: forall lock payload
   . Event (Attribute I_)
  -> Array (Domable lock payload)
  -> Domable lock payload
i attributes kids = Domable (Element' (elementify "i" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

i_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
i_ = i empty

