module Deku.DOM.Elt.Small where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Small_

small
  :: forall lock payload
   . AnEvent Zora (Attribute Small_)
  -> Array (Domable lock payload)
  -> Domable lock payload
small attributes kids = Element' (elementify "small" attributes (fixed kids))

small_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
small_ = small empty

