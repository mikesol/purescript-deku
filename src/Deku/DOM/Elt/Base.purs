module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Base_

base
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Base_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
base attributes kids = Element' (elementify "base" attributes (fixed kids))

base_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
base_ = base empty

