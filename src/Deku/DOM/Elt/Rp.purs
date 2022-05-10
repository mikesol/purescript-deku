module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Rp_

rp
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Rp_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
rp attributes kids = Element'
  (elementify "rp" attributes (FixedChildren' (FixedChildren kids)))

rp_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
rp_ = rp empty

