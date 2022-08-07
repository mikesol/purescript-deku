module Deku.DOM.Elt.Rt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Rt_

rt
  :: forall lock payload
   . AnEvent M (Attribute Rt_)
  -> Array (Domable lock payload)
  -> Domable lock payload
rt attributes kids = Element' (elementify "rt" attributes (fixed kids))

rt_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
rt_ = rt empty

