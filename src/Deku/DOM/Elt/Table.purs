module Deku.DOM.Elt.Table where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Table_

table
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Table_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
table attributes kids = Element'
  (elementify "table" attributes (FixedChildren' (FixedChildren kids)))

table_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
table_ = table empty

