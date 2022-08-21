module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Thead_

thead
  :: forall lock payload
   . AnEvent Zora (Attribute Thead_)
  -> Array (Domable lock payload)
  -> Domable lock payload
thead attributes kids = Element' (elementify "thead" attributes (fixed kids))

thead_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
thead_ = thead empty

