module Deku.DOM.Elt.Fieldset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Fieldset_

fieldset
  :: forall lock payload
   . AnEvent M (Attribute Fieldset_)
  -> Array (Domable lock payload)
  -> Domable lock payload
fieldset attributes kids = Element'
  (elementify "fieldset" attributes (fixed kids))

fieldset_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
fieldset_ = fieldset empty

