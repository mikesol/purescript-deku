module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Rp_

rp
  :: forall lock payload
   . AnEvent M (Attribute Rp_)
  -> Array (Domable lock payload)
  -> Domable lock payload
rp attributes kids = Element' (elementify "rp" attributes (fixed kids))

rp_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
rp_ = rp empty

