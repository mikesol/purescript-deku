module Deku.DOM.Elt.Map where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Map_

map
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Map_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
map attributes kids = Element'
  (elementify "map" attributes (FixedChildren' (FixedChildren kids)))

map_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
map_ = map empty

