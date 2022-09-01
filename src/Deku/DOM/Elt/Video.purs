module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Video_

video
  :: forall lock payload
   . Event (Attribute Video_)
  -> Array (Domable lock payload)
  -> Domable lock payload
video attributes kids = Element' (elementify "video" attributes (fixed kids))

video_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
video_ = video empty

