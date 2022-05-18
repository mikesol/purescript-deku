module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Abbr_

abbr
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Abbr_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
abbr attributes kids = Element' (elementify "abbr" attributes (fixed kids))

abbr_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
abbr_ = abbr empty

