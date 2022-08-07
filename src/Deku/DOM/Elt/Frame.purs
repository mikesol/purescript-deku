module Deku.DOM.Elt.Frame where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Frame_

frame
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Frame_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
frame attributes kids = Element' (elementify "frame" attributes (fixed kids))

frame_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
frame_ = frame empty

