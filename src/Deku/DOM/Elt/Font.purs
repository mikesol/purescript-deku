module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Font_

font
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Font_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
font attributes kids = Element' (elementify "font" attributes (fixed kids))

font_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
font_ = font empty

