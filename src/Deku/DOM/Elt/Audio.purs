module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Audio_

audio
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Audio_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
audio attributes kids = Element'
  (elementify "audio" attributes (FixedChildren' (FixedChildren kids)))

audio_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
audio_ = audio empty

