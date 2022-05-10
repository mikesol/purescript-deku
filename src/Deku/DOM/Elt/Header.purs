module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Header_

header
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Header_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
header attributes kids = Element'
  (elementify "header" attributes (FixedChildren' (FixedChildren kids)))

header_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
header_ = header empty

