module Deku.DOM.Elt.Caption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Caption_

caption
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Caption_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
caption attributes kids = Element' (elementify "caption" attributes (fixed kids))

caption_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
caption_ = caption empty

