module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Output_

output
  :: forall lock payload
   . AnEvent M (Attribute Output_)
  -> Array (Domable lock payload)
  -> Domable lock payload
output attributes kids = Element' (elementify "output" attributes (fixed kids))

output_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
output_ = output empty

