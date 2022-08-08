module Deku.DOM.Elt.Aside where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Aside_

aside
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Aside_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
aside attributes kids = Element' (elementify "aside" attributes (fixed kids))

aside_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
aside_ = aside empty

