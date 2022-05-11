module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Control.Monad.ST.Class (class MonadST)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Col_

col
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Col_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
col attributes kids = Element' (elementify "col" attributes (fixed kids))

col_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
col_ = col empty

