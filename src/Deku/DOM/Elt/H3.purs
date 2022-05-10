module Deku.DOM.Elt.H3 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data H3_

h3
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute H3_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
h3 attributes kids = Element'
  (elementify "h3" attributes (FixedChildren' (FixedChildren kids)))

h3_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
h3_ = h3 empty

