module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Body_

body
  :: forall lock payload
   . AnEvent Zora (Attribute Body_)
  -> Array (Domable lock payload)
  -> Domable lock payload
body attributes kids = Element' (elementify "body" attributes (fixed kids))

body_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
body_ = body empty

