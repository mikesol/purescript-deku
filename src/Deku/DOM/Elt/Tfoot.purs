module Deku.DOM.Elt.Tfoot where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Tfoot_

tfoot
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Tfoot_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
tfoot attributes kids = Element' (elementify "tfoot" attributes (fixed kids))

tfoot_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
tfoot_ = tfoot empty

