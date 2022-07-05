module Deku.DOM.Elt.Sup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Sup_

sup
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Sup_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
sup attributes kids = Element' (elementify "sup" attributes (fixed kids))

sup_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
sup_ = sup empty

