module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data B_

b
  :: forall lock payload
   . Event (Attribute B_)
  -> Array (Domable lock payload)
  -> Domable lock payload
b attributes kids = Element' (elementify "b" attributes (fixed kids))

b_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
b_ = b empty

