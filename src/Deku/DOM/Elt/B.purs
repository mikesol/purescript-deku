module Deku.DOM.Elt.B where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data B_

b
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute B_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
b attributes kids = Element' (elementify "b" attributes (fixed kids))

b_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
b_ = b empty

