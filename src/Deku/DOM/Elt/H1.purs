module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data H1_

h1
  :: forall lock payload
   . AnEvent M (Attribute H1_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h1 attributes kids = Element' (elementify "h1" attributes (fixed kids))

h1_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h1_ = h1 empty

