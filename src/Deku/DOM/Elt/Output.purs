module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable')
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)
import Safe.Coerce (coerce)



data Output_

output
  :: forall lock payload
   . Event (Attribute Output_)
  -> Array (Domable lock payload)
  -> Domable lock payload
output attributes kids = Domable (Element' (elementify "output" attributes ((coerce :: Domable' lock payload -> Domable lock payload)  (fixed (coerce kids)))))

output_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
output_ = output empty

