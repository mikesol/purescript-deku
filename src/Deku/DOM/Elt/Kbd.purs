module Deku.DOM.Elt.Kbd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Kbd_

kbd
  :: forall lock payload
   . AnEvent Zora (Attribute Kbd_)
  -> Array (Domable lock payload)
  -> Domable lock payload
kbd attributes kids = Element' (elementify "kbd" attributes (fixed kids))

kbd_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
kbd_ = kbd empty

