module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Canvas_

canvas
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Canvas_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
canvas attributes kids = Element'
  (elementify "canvas" attributes (FixedChildren' (FixedChildren kids)))

canvas_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
canvas_ = canvas empty

