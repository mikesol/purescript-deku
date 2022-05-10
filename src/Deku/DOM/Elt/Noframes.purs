module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Noframes_

noframes
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Noframes_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
noframes attributes kids = Element'
  (elementify "noframes" attributes (FixedChildren' (FixedChildren kids)))

noframes_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
noframes_ = noframes empty

