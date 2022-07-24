module Deku.DOM.Elt.Table where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Table_

table
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Table_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
table attributes kids = Element' (elementify "table" attributes (fixed kids))

table_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
table_ = table empty

