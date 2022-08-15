module Deku.DOM.Elt.Button where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Button_

button
  :: forall lock payload
   . AnEvent Zora (Attribute Button_)
  -> Array (Domable lock payload)
  -> Domable lock payload
button attributes kids = Element' (elementify "button" attributes (fixed kids))

button_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
button_ = button empty

