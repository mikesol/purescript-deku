module Deku.DOM.Elt.Bdi where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Bdi_

bdi
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Bdi_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
bdi attributes kids = Element'
  (elementify "bdi" attributes (FixedChildren' (FixedChildren kids)))

bdi_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
bdi_ = bdi empty

