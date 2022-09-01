module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data H3_

h3
  :: forall lock payload
   . Event (Attribute H3_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h3 attributes kids = Element' (elementify "h3" attributes (fixed kids))

h3_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h3_ = h3 empty

