module Deku.DOM.Elt.Acronym where

import Control.Monad.ST.Class (class MonadST)
import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Acronym_

acronym
  :: forall s m lock payload
   . MonadST s m
  => AnEvent m (Attribute Acronym_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
acronym attributes kids = Element'
  (elementify "acronym" attributes (fixed kids))

acronym_
  :: forall s m lock payload
   . MonadST s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
acronym_ = acronym empty

