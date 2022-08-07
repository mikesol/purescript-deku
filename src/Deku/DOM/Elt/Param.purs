module Deku.DOM.Elt.Param where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Param_

param
  :: forall lock payload
   . AnEvent M (Attribute Param_)
  -> Array (Domable lock payload)
  -> Domable lock payload
param attributes kids = Element' (elementify "param" attributes (fixed kids))

param_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
param_ = param empty

