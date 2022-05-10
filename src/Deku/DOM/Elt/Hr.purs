module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Hr_

hr
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Hr_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
hr attributes kids = Element'
  (elementify "hr" attributes (FixedChildren' (FixedChildren kids)))

hr_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
hr_ = hr empty

