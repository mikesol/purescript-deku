module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Video_

video
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Video_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
video attributes kids = Element' (elementify "video" attributes (fixed kids))

video_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
video_ = video empty

