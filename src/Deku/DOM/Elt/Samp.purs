module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Samp_

samp
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Samp_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
samp attributes kids = Element' (elementify "samp" attributes (fixed kids))

samp_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
samp_ = samp empty

