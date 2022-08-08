module Deku.DOM.Elt.H6 where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data H6_

h6
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute H6_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
h6 attributes kids = Element' (elementify "h6" attributes (fixed kids))

h6_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
h6_ = h6 empty

