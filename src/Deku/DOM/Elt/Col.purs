module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Col_

col
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Col_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
col attributes kids = Element' (elementify "col" attributes (fixed kids))

col_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
col_ = col empty

