module Deku.DOM.Elt.Fieldset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Fieldset_

fieldset
  :: forall lock payload
   . Event (Attribute Fieldset_)
  -> Array (Domable lock payload)
  -> Domable lock payload
fieldset attributes kids = Element' (elementify "fieldset" attributes (fixed kids))

fieldset_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
fieldset_ = fieldset empty

