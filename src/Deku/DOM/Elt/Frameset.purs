module Deku.DOM.Elt.Frameset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Frameset_

frameset
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Frameset_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
frameset attributes kids = Element' (elementify "frameset" attributes (fixed kids))

frameset_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
frameset_ = frameset empty

