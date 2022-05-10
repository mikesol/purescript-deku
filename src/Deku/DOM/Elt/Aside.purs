module Deku.DOM.Elt.Aside where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Aside_

aside
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Aside_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
aside attributes kids = Element'
  (elementify "aside" attributes (FixedChildren' (FixedChildren kids)))

aside_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
aside_ = aside empty

