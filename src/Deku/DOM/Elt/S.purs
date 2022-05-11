module Deku.DOM.Elt.S where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data S_

s
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute S_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
s attributes kids = Element' (elementify "s" attributes (fixed kids))

s_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
s_ = s empty

