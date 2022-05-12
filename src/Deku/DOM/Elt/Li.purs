module Deku.DOM.Elt.Li where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Li_

li
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Li_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
li attributes kids = Element' (elementify "li" attributes (fixed kids))

li_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
li_ = li empty

