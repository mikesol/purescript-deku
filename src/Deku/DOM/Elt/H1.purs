module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data H1_

h1
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute H1_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
h1 attributes kids = Element'
  (elementify "h1" attributes (FixedChildren' (FixedChildren kids)))

h1_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
h1_ = h1 empty

