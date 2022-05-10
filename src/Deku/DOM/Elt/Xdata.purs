module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Xdata_

xdata
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Xdata_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
xdata attributes kids = Element'
  (elementify "data" attributes (FixedChildren' (FixedChildren kids)))

xdata_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
xdata_ = xdata empty

