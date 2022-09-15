module Deku.DOM.Elt.U where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data U_

u
  :: forall lock payload
   . Event (Attribute U_)
  -> Array (Domable lock payload)
  -> Domable lock payload
u attributes kids = Domable (Element' (elementify "u" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

u_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
u_ = u empty

