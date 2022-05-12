module Deku.DOM.Elt.P where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data P_

p
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute P_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
p attributes kids = Element' (elementify "p" attributes (fixed kids))

p_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
p_ = p empty

