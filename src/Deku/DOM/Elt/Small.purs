module Deku.DOM.Elt.Small where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Small_

small
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Small_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
small attributes kids = Element' (elementify "small" attributes (FixedChildren' (FixedChildren kids)))

small_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
small_ = small empty

