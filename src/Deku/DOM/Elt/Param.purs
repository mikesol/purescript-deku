module Deku.DOM.Elt.Param where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Param_

param
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Param_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
param attributes kids = Element' (elementify "param" attributes (fixed kids))

param_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
param_ = param empty

