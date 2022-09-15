module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Rp_

rp
  :: forall lock payload
   . Event (Attribute Rp_)
  -> Array (Domable lock payload)
  -> Domable lock payload
rp attributes kids = Domable (Element' (elementify "rp" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

rp_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
rp_ = rp empty

