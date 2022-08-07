module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Font_

font
  :: forall lock payload
   . AnEvent M (Attribute Font_)
  -> Array (Domable lock payload)
  -> Domable lock payload
font attributes kids = Element' (elementify "font" attributes (fixed kids))

font_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
font_ = font empty

