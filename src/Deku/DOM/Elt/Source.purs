module Deku.DOM.Elt.Source where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Source_

source
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Source_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
source attributes kids = Element' (elementify "source" attributes (fixed kids))

source_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
source_ = source empty

