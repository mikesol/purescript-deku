module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Option_

option
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Option_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
option attributes kids = Element' (elementify "option" attributes (fixed kids))

option_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
option_ = option empty

