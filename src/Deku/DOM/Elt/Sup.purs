module Deku.DOM.Elt.Sup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Sup_

sup
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Sup_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
sup attributes kids = Element'
  (elementify "sup" attributes (FixedChildren' (FixedChildren kids)))

sup_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
sup_ = sup empty

