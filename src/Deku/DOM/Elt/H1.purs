module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data H1_

h1
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute H1_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
h1 attributes kids = Element' (elementify "h1" attributes (fixed kids))

h1_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
h1_ = h1 empty

