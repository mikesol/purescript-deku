module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Td_

td
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Td_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
td attributes kids = Element' (elementify "td" attributes (fixed kids))

td_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
td_ = td empty

