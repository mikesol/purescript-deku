module Deku.DOM.Elt.Center where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Center_

center
  :: forall lock payload
   . AnEvent Zora (Attribute Center_)
  -> Array (Domable lock payload)
  -> Domable lock payload
center attributes kids = Element' (elementify "center" attributes (fixed kids))

center_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
center_ = center empty

