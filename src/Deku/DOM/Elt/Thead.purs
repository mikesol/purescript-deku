module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Thead_

thead
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Thead_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
thead attributes kids = Element' (elementify "thead" attributes (fixed kids))

thead_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
thead_ = thead empty

