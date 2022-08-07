module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data P_

p
  :: forall lock payload
   . AnEvent M (Attribute P_)
  -> Array (Domable lock payload)
  -> Domable lock payload
p attributes kids = Element' (elementify "p" attributes (fixed kids))

p_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
p_ = p empty

