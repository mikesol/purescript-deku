module Deku.DOM.Elt.Tr where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Tr_

tr
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Tr_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
tr attributes kids = Element' (elementify "tr" attributes (fixed kids))

tr_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
tr_ = tr empty

