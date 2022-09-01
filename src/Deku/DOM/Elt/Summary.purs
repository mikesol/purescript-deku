module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Summary_

summary
  :: forall lock payload
   . Event (Attribute Summary_)
  -> Array (Domable lock payload)
  -> Domable lock payload
summary attributes kids = Element' (elementify "summary" attributes (fixed kids))

summary_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
summary_ = summary empty

