module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Optgroup_

optgroup
  :: forall lock payload
   . AnEvent Zora (Attribute Optgroup_)
  -> Array (Domable lock payload)
  -> Domable lock payload
optgroup attributes kids = Element'
  (elementify "optgroup" attributes (fixed kids))

optgroup_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
optgroup_ = optgroup empty

