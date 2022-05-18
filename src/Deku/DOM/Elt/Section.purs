module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Section_

section
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Section_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
section attributes kids = Element' (elementify "section" attributes (fixed kids))

section_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
section_ = section empty

