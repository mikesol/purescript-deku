module Deku.DOM.Elt.Meta where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Meta_

meta
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Meta_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
meta attributes kids = Element' (elementify "meta" attributes (fixed kids))

meta_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
meta_ = meta empty

