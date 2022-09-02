module Deku.DOM.Elt.Textarea where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Textarea_

textarea
  :: forall lock payload
   . Event (Attribute Textarea_)
  -> Array (Domable lock payload)
  -> Domable lock payload
textarea attributes kids = Element' (elementify "textarea" attributes (fixed kids))

textarea_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
textarea_ = textarea empty

