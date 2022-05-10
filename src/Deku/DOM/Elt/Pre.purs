module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Pre_

pre
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Pre_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
pre attributes kids = Element'
  (elementify "pre" attributes (FixedChildren' (FixedChildren kids)))

pre_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
pre_ = pre empty

