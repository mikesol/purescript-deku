module Deku.DOM.Elt.H5 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data H5_

h5
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute H5_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
h5 attributes kids = Element' (elementify "h5" attributes (fixed kids))

h5_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
h5_ = h5 empty

