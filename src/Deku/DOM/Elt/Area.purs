module Deku.DOM.Elt.Area where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Area_

area
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Area_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
area attributes kids = Element' (elementify "area" attributes (fixed kids))

area_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
area_ = area empty

