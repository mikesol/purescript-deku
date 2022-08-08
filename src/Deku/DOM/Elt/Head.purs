module Deku.DOM.Elt.Head where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Head_

head
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Head_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
head attributes kids = Element' (elementify "head" attributes (fixed kids))

head_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
head_ = head empty

