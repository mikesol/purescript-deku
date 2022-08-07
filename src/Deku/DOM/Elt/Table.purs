module Deku.DOM.Elt.Table where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Table_

table
  :: forall lock payload
   . AnEvent M (Attribute Table_)
  -> Array (Domable lock payload)
  -> Domable lock payload
table attributes kids = Element' (elementify "table" attributes (fixed kids))

table_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
table_ = table empty

