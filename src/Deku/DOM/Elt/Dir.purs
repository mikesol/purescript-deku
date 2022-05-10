module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Dir_

dir
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Dir_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
dir attributes kids = Element'
  (elementify "dir" attributes (FixedChildren' (FixedChildren kids)))

dir_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
dir_ = dir empty

