module Deku.DOM.Elt.Output where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Output_

output
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Output_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
output attributes kids = Element'
  (elementify "output" attributes (FixedChildren' (FixedChildren kids)))

output_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
output_ = output empty

