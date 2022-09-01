module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Details_

details
  :: forall lock payload
   . Event (Attribute Details_)
  -> Array (Domable lock payload)
  -> Domable lock payload
details attributes kids = Element' (elementify "details" attributes (fixed kids))

details_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
details_ = details empty

