module Deku.DOM.Elt.Progress where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Progress_

progress
  :: forall lock payload
   . Event (Attribute Progress_)
  -> Array (Domable lock payload)
  -> Domable lock payload
progress attributes kids = Domable (Element' (elementify "progress" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

progress_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
progress_ = progress empty

