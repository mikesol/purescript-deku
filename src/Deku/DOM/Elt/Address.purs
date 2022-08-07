module Deku.DOM.Elt.Address where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Address_

address
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Address_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
address attributes kids = Element'
  (elementify "address" attributes (fixed kids))

address_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
address_ = address empty

