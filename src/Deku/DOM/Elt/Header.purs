module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Header_

header
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Header_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
header attributes kids = Element' (elementify "header" attributes (fixed kids))

header_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
header_ = header empty

