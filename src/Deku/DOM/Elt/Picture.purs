module Deku.DOM.Elt.Picture where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Picture_

picture
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Picture_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
picture attributes kids = Element' (elementify "picture" attributes (fixed kids))

picture_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
picture_ = picture empty

