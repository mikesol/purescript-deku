module Deku.DOM.Elt.Label where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Label_

label
  :: forall lock payload
   . AnEvent M (Attribute Label_)
  -> Array (Domable lock payload)
  -> Domable lock payload
label attributes kids = Element' (elementify "label" attributes (fixed kids))

label_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
label_ = label empty

