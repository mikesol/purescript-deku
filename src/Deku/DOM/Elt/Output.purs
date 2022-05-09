module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Output_

output
  :: forall lock payload
   . Event (Attribute Output_)
  -> Array (Domable lock payload)
  -> Domable lock payload
output attributes kids = Element' (elementify "output" attributes (FixedChildren' (FixedChildren kids)))

output_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
output_ = output empty

