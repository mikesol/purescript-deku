module Deku.DOM.Elt.H2 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data H2_

h2
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute H2_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
h2 attributes kids = Element' (elementify "h2" attributes (fixed kids))

h2_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
h2_ = h2 empty

