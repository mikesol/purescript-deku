module Deku.DOM.Elt.Time where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Time_

time
  :: forall lock payload
   . Event (Attribute Time_)
  -> Array (Domable lock payload)
  -> Domable lock payload
time attributes kids = Domable (Element' (elementify "time" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

time_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
time_ = time empty

