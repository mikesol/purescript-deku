module Deku.DOM.Elt.Tt where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Tt_

tt
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Tt_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
tt attributes kids = Element' (elementify "tt" attributes (fixed kids))

tt_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
tt_ = tt empty

