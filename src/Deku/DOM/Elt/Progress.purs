module Deku.DOM.Elt.Progress where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Progress_

progress
  :: forall lock payload
   . AnEvent M (Attribute Progress_)
  -> Array (Domable lock payload)
  -> Domable lock payload
progress attributes kids = Element'
  (elementify "progress" attributes (fixed kids))

progress_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
progress_ = progress empty

