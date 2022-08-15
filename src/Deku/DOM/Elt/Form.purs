module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Form_

form
  :: forall lock payload
   . AnEvent Zora (Attribute Form_)
  -> Array (Domable lock payload)
  -> Domable lock payload
form attributes kids = Element' (elementify "form" attributes (fixed kids))

form_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
form_ = form empty

