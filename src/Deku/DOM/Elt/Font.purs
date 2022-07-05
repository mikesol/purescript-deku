module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Font_

font
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Font_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
font attributes kids = Element' (elementify "font" attributes (fixed kids))

font_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
font_ = font empty

