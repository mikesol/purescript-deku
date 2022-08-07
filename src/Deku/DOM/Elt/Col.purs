module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Col_

col
  :: forall lock payload
   . AnEvent M (Attribute Col_)
  -> Array (Domable lock payload)
  -> Domable lock payload
col attributes kids = Element' (elementify "col" attributes (fixed kids))

col_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
col_ = col empty

