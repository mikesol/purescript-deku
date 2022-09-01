module Deku.DOM.Elt.Dt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Dt_

dt
  :: forall lock payload
   . Event (Attribute Dt_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dt attributes kids = Element' (elementify "dt" attributes (fixed kids))

dt_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dt_ = dt empty

