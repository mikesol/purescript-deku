module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Samp_

samp
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Samp_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
samp attributes kids = Element'
  (elementify "samp" attributes (FixedChildren' (FixedChildren kids)))

samp_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
samp_ = samp empty

