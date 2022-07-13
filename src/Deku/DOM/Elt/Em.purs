module Deku.DOM.Elt.Em where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Em_

em
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Em_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
em attributes kids = Element' (elementify "em" attributes (fixed kids))

em_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
em_ = em empty

