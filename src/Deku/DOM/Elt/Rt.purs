module Deku.DOM.Elt.Rt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Rt_

rt
  :: forall lock payload
   . Event (Attribute Rt_)
  -> Array (Domable lock payload)
  -> Domable lock payload
rt attributes kids = Element' (elementify "rt" attributes (fixed kids))

rt_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
rt_ = rt empty

