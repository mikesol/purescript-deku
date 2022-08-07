module Deku.DOM.Elt.Dfn where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Dfn_

dfn
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Dfn_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
dfn attributes kids = Element' (elementify "dfn" attributes (fixed kids))

dfn_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
dfn_ = dfn empty

