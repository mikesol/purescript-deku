module Deku.DOM.Elt.Meta where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Meta_

meta
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Meta_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
meta attributes kids = Element' (elementify "meta" attributes (fixed kids))

meta_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
meta_ = meta empty

