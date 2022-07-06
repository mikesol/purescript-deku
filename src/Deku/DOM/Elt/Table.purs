module Deku.DOM.Elt.Table where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Table_

table
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Table_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
table attributes kids = Element' (elementify "table" attributes (fixed kids))

table_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
table_ = table empty

