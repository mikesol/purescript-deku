module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Output_

output
  :: forall lock payload
   . Event (Attribute Output_)
  -> Array (Domable lock payload)
  -> Domable lock payload
output attributes kids = Element' (elementify "output" attributes (fixed kids))

output_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
output_ = output empty

