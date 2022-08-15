module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Template_

template
  :: forall lock payload
   . AnEvent Zora (Attribute Template_)
  -> Array (Domable lock payload)
  -> Domable lock payload
template attributes kids = Element'
  (elementify "template" attributes (fixed kids))

template_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
template_ = template empty

