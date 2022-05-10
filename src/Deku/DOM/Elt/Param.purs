module Deku.DOM.Elt.Param where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Param_

param
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Param_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
param attributes kids = Element'
  (elementify "param" attributes (FixedChildren' (FixedChildren kids)))

param_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
param_ = param empty

