module Deku.DOM.Elt.Source where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Source_

source
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Source_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
source attributes kids = Element' (elementify "source" attributes (fixed kids))

source_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
source_ = source empty

