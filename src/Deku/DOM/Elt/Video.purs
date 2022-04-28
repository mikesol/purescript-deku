module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Video_

video
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Video_)
  -> seed
  -> Element lock payload
video attributes seed = elementify "video" attributes (plant seed)

video_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
video_ = video empty

