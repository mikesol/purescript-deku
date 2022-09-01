module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Col_

col
  :: forall lock payload
   . Event (Attribute Col_)
  -> Array (Domable lock payload)
  -> Domable lock payload
col attributes kids = Element' (elementify "col" attributes (fixed kids))

col_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
col_ = col empty

