module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Template_

template
  :: forall lock payload
   . AnEvent M (Attribute Template_)
  -> Array (Domable lock payload)
  -> Domable lock payload
template attributes kids = Element'
  (elementify "template" attributes (fixed kids))

template_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
template_ = template empty

