module Deku.DOM.Elt.Bdo where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Bdo_

bdo
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Bdo_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
bdo attributes kids = Element' (elementify "bdo" attributes (fixed kids))

bdo_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
bdo_ = bdo empty

