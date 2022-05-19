module Deku.DOM.Elt.Noscript where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Noscript_

noscript
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Noscript_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
noscript attributes kids = Element' (elementify "noscript" attributes (fixed kids))

noscript_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
noscript_ = noscript empty

