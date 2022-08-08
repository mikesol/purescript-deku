module Deku.DOM.Elt.Strong where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Strong_

strong
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Strong_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
strong attributes kids = Element' (elementify "strong" attributes (fixed kids))

strong_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
strong_ = strong empty

