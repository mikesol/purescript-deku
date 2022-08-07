module Deku.DOM.Elt.H4 where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data H4_

h4
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute H4_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
h4 attributes kids = Element' (elementify "h4" attributes (fixed kids))

h4_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
h4_ = h4 empty

