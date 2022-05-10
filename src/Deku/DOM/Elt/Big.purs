module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Big_

big
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Big_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
big attributes kids = Element'
  (elementify "big" attributes (FixedChildren' (FixedChildren kids)))

big_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
big_ = big empty

