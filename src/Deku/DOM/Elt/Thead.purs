module Deku.DOM.Elt.Thead where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Thead_

thead
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Thead_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
thead attributes kids = Element' (elementify "thead" attributes (fixed kids))

thead_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
thead_ = thead empty

