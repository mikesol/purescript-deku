module Deku.DOM.Elt.Optgroup where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Optgroup_

optgroup
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Optgroup_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
optgroup attributes kids = Element' (elementify "optgroup" attributes (fixed kids))

optgroup_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
optgroup_ = optgroup empty

