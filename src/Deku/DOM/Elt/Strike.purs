module Deku.DOM.Elt.Strike where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (AnEvent)

data Strike_

strike
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Strike_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
strike attributes kids = Element'
  (elementify "strike" attributes (FixedChildren' (FixedChildren kids)))

strike_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
strike_ = strike empty

