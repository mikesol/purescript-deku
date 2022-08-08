module Deku.DOM.Elt.Q where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Q_

q
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Q_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
q attributes kids = Element' (elementify "q" attributes (fixed kids))

q_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
q_ = q empty

