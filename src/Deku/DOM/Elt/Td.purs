module Deku.DOM.Elt.Td where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Td_

td
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Td_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
td attributes kids = Element' (elementify "td" attributes (FixedChildren' (FixedChildren kids)))

td_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
td_ = td empty

