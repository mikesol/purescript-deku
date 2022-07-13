module Deku.DOM.Elt.Strong where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Strong_

strong
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Strong_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
strong attributes kids = Element' (elementify "strong" attributes (fixed kids))

strong_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
strong_ = strong empty

