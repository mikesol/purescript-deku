module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Video_

video
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Video_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
video attributes kids = Element'
  (elementify "video" attributes (FixedChildren' (FixedChildren kids)))

video_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
video_ = video empty

