module Deku.DOM.Elt.Center where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Center_

center
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Center_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
center attributes kids = Element' (elementify "center" attributes (fixed kids))

center_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
center_ = center empty

