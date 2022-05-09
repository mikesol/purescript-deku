module Deku.DOM.Elt.Dt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Dt_

dt
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Dt_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
dt attributes kids = Element' (elementify "dt" attributes (FixedChildren' (FixedChildren kids)))

dt_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
dt_ = dt empty

