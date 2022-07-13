module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Dl_

dl
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Dl_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
dl attributes kids = Element' (elementify "dl" attributes (fixed kids))

dl_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
dl_ = dl empty

