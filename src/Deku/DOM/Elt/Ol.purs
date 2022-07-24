module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Ol_

ol
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Ol_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
ol attributes kids = Element' (elementify "ol" attributes (fixed kids))

ol_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
ol_ = ol empty

