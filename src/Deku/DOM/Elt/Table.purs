module Deku.DOM.Elt.Table where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Table_

table
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Table_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
table attributes kids = Element' (elementify "table" attributes (fixed kids))

table_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
table_ = table empty

