module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Base_

base
  :: forall lock payload
   . AnEvent M (Attribute Base_)
  -> Array (Domable lock payload)
  -> Domable lock payload
base attributes kids = Element' (elementify "base" attributes (fixed kids))

base_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
base_ = base empty

