module Deku.DOM.Elt.U where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data U_

u
  :: forall lock payload
   . AnEvent Zora (Attribute U_)
  -> Array (Domable lock payload)
  -> Domable lock payload
u attributes kids = Element' (elementify "u" attributes (fixed kids))

u_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
u_ = u empty

