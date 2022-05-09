module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Track_

track
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Track_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
track attributes kids = Element' (elementify "track" attributes (FixedChildren' (FixedChildren kids)))

track_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
track_ = track empty

