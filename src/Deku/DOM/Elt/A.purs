module Deku.DOM.Elt.A where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data A_

a
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute A_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
a attributes kids = Element' (elementify "a" attributes (fixed kids))

a_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
a_ = a empty

