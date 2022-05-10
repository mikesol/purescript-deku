module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Summary_

summary
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Summary_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
summary attributes kids = Element'
  (elementify "summary" attributes (FixedChildren' (FixedChildren kids)))

summary_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
summary_ = summary empty

