module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Dd_

dd
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Dd_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
dd attributes kids = Element' (elementify "dd" attributes (fixed kids))

dd_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
dd_ = dd empty

