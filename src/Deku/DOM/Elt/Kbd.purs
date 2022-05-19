module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Kbd_

kbd
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Kbd_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
kbd attributes kids = Element' (elementify "kbd" attributes (fixed kids))

kbd_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
kbd_ = kbd empty

