module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Details_

details
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Details_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
details attributes kids = Element' (elementify "details" attributes (FixedChildren' (FixedChildren kids)))

details_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
details_ = details empty

