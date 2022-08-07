module Deku.DOM.Elt.H2 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data H2_

h2
  :: forall lock payload
   . AnEvent M (Attribute H2_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h2 attributes kids = Element' (elementify "h2" attributes (fixed kids))

h2_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h2_ = h2 empty

