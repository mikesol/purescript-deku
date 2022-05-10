module Deku.DOM.Elt.Caption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Caption_

caption
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Caption_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
caption attributes kids = Element'
  (elementify "caption" attributes (FixedChildren' (FixedChildren kids)))

caption_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
caption_ = caption empty

