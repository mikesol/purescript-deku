module Deku.DOM.Elt.Tbody where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Tbody_

tbody
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Tbody_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
tbody attributes kids = Element'
  (elementify "tbody" attributes (FixedChildren' (FixedChildren kids)))

tbody_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
tbody_ = tbody empty

