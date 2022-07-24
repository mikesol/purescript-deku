module Deku.DOM.Elt.Tfoot where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Tfoot_

tfoot
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Tfoot_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
tfoot attributes kids = Element' (elementify "tfoot" attributes (fixed kids))

tfoot_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
tfoot_ = tfoot empty

