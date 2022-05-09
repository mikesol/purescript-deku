module Deku.DOM.Elt.Rt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Rt_

rt
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Rt_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
rt attributes kids = Element' (elementify "rt" attributes (FixedChildren' (FixedChildren kids)))

rt_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
rt_ = rt empty

