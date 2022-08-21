module Deku.DOM.Elt.Head where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Head_

head
  :: forall lock payload
   . AnEvent Zora (Attribute Head_)
  -> Array (Domable lock payload)
  -> Domable lock payload
head attributes kids = Element' (elementify "head" attributes (fixed kids))

head_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
head_ = head empty

