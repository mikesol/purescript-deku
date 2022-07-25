module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Br_

br
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Br_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
br attributes kids = Element' (elementify "br" attributes (fixed kids))

br_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
br_ = br empty

