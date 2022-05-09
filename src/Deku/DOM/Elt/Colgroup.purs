module Deku.DOM.Elt.Colgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Colgroup_

colgroup
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Colgroup_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
colgroup attributes kids = Element' (elementify "colgroup" attributes (FixedChildren' (FixedChildren kids)))

colgroup_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
colgroup_ = colgroup empty

