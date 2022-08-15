module Deku.DOM.Elt.Tbody where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Tbody_

tbody
  :: forall lock payload
   . AnEvent Zora (Attribute Tbody_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tbody attributes kids = Element' (elementify "tbody" attributes (fixed kids))

tbody_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tbody_ = tbody empty

